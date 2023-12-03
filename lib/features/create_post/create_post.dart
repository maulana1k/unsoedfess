import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unsoedfess/features/home/models/post_model.dart';
import 'package:unsoedfess/features/profile/avatar_profile.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  final auth = FirebaseAuth.instance;
  List<File> media = [];
  final contentCtrl = TextEditingController();

  Future<void> _openGallery(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    log('media list:');
    if (pickedFile != null) {
      setState(() {
        final newMedia = media.toList()..add(File(pickedFile.path));
        media = newMedia;
      });
    }
    log(media.toString());
  }

  Future<String> _uploadImage(File imageFile, String userId) async {
    final storage = FirebaseStorage.instance;
    try {
      String imagePath = 'posts/$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';
      UploadTask uploadTask = storage.ref().child(imagePath).putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  Future<void> sendPost(context) async {
    final firestore = FirebaseFirestore.instance;
    final user = ref.read(userProvider).profile;
    List<String> mediaUrl = [];
    if (media.isNotEmpty) {}
    final newPost = PostModel(
        userID: auth.currentUser!.uid,
        author:
            Author(username: user!.username, avatarUrl: user.avatar, displayName: user.displayName),
        content: contentCtrl.text,
        media: mediaUrl,
        timestamp: DateTime.now());
    try {
      await firestore.collection('posts').add(newPost.toJson());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post done'),
          duration: Duration(seconds: 2), // Adjust as needed
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      // Handle error, and show SnackBar on failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error posting: $e'),
          duration: const Duration(seconds: 2), // Adjust as needed
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider).profile;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(FluentIcons.dismiss_12_regular)),
        title: Text('Create Post',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600).copyWith(fontSize: 20)),
        actions: [
          TextButton(
              onPressed: () => sendPost(context),
              child: const Text('Post',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AvatarProfile(radius: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          user!.username,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          minLines: 1,
                          maxLines: 10,
                          controller: contentCtrl,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Write something'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (media.isNotEmpty)
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: media
                                .map((url) => Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 4, left: 4),
                                          clipBehavior: Clip.hardEdge,
                                          decoration:
                                              BoxDecoration(borderRadius: BorderRadius.circular(6)),
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Image.file(
                                              url,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(FluentIcons.dismiss_16_filled)))
                                      ],
                                    ))
                                .toList()
                              ..insert(0, Stack(children: [Container(width: 20)]))),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 64),
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
                      // const SizedBox(width: 18),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FluentIcons.number_symbol_16_regular,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
