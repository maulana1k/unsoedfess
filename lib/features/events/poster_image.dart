import 'package:flutter/material.dart';
import 'package:unsoedfess/features/events/poster_view.dart';

class PosterImage extends StatelessWidget {
  final String imageUrl;
  const PosterImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PosterView(imageUrl: imageUrl)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: AspectRatio(
          aspectRatio: 10 / 16,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUrl))),
          ),
        ),
      ),
    );
  }
}
