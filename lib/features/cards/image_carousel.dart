import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> media;
  const ImageCarousel({
    super.key,
    required this.media,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final _controller = PageController();
  // final List _imageUrls = [
  //   'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/p1/844/2023/10/06/Snapinstaapp_383228145_633134392274377_6755131242156320552_n_1080-1-3871558868.jpg',
  //   'https://www.konsultanpajaksurabaya.com/uploads/img/foto_berita/alasan-penggemar-musik-harus-m_1683790508.jpg',
  //   'https://www.infobdg.com/v2/wp-content/uploads/2022/07/6B6E36D2-DF50-4A39-A4C9-008BBE6558B7.jpeg'
  // ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            children: widget.media.map((url) {
              return AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        if (widget.media.length > 1)
          SmoothPageIndicator(
            controller: _controller,
            count: widget.media.length,
            effect:
                const ExpandingDotsEffect(dotHeight: 4, dotWidth: 4, activeDotColor: Colors.black),
          )
      ],
    );
  }
}
