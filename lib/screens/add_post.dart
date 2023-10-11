import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(FluentIcons.dismiss_12_regular)),
        title: const Text('Write Post', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
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
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Whats you think'),
                        ),
                        if (_pickedImage != null)
                          Image.file(_pickedImage!, width: double.infinity, height: 400),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () => _openGallery(ImageSource.gallery),
                                      icon: const Icon(
                                        FluentIcons.image_16_regular,
                                        color: Colors.grey,
                                      )),
                                  IconButton(
                                      onPressed: () => _openGallery(ImageSource.camera),
                                      icon: const Icon(
                                        FluentIcons.camera_16_regular,
                                        color: Colors.grey,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
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
    );
  }
}
