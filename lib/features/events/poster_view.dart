import 'package:flutter/material.dart';

class PosterView extends StatefulWidget {
  final String imageUrl;
  const PosterView({super.key, required this.imageUrl});

  @override
  State<PosterView> createState() => _PosterViewState();
}

class _PosterViewState extends State<PosterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.imageUrl))),
          ),
        ),
      ),
    );
  }
}
