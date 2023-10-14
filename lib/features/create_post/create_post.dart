import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? _pickedImage;
  Future<void> _openGallery(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(FluentIcons.dismiss_12_regular)),
        title: const Text('Write Post', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg')),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          const Text(
                            'felicia.angel',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const TextField(
                            keyboardType: TextInputType.multiline,
                            autofocus: true,
                            minLines: 1,
                            maxLines: 10,
                            decoration:
                                InputDecoration(border: InputBorder.none, hintText: 'Text here'),
                          ),
                          if (_pickedImage != null)
                            Image.file(_pickedImage!, width: double.infinity, height: 400),
                          // const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () => _openGallery(ImageSource.gallery),
                                        child: const Icon(
                                          FluentIcons.image_16_regular,
                                          color: Colors.grey,
                                        )),
                                    const SizedBox(width: 18),
                                    GestureDetector(
                                        onTap: () => _openGallery(ImageSource.camera),
                                        child: const Icon(
                                          FluentIcons.camera_16_regular,
                                          color: Colors.grey,
                                        )),
                                    const SizedBox(width: 18),
                                    GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          FluentIcons.number_symbol_16_regular,
                                          color: Colors.grey,
                                        ))
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Post',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.blue)))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
