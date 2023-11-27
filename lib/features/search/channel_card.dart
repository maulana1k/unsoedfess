import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsoedfess/features/channels/channel_page.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 220,
      width: 260,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 0.5),
          borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const ChannelPage()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 0.5),
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://akcdn.detik.net.id/community/media/visual/2021/03/13/kampus-universitas-indonesia-dok-istimewa.jpeg?w=700&q=90'))),
                  ),
                  TextButton(
                      style: const ButtonStyle(
                          visualDensity: VisualDensity.compact,
                          backgroundColor: MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {},
                      child: const Text('Follow',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)))
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Teknik Jaya',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const Text('Tempat tanya, sharing dan cari jodoh jika beruntung 🤪',
                  maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14)),
              const Text('1.5k followers · 245 members',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
