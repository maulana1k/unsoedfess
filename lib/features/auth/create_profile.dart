import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';
import 'package:unsoedfess/features/auth/services/auth_service.dart';
import 'package:unsoedfess/features/main_screen/screens/main_screen.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class CreateProfile extends ConsumerStatefulWidget {
  const CreateProfile({super.key});

  @override
  ConsumerState<CreateProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<CreateProfile> {
  final _displayNameCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  late final UserProfile _profile;
  File? _imageFile;
  @override
  void initState() {
    super.initState();
    _profile = ref.read(userProvider).profile!;
    _displayNameCtrl.text = _profile.username;
    _bioCtrl.text = _profile.bio;
  }

  Future _imagePicker() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final cropper = ImageCropper();
      final croppedImage = await cropper.cropImage(
          sourcePath: file.path,
          cropStyle: CropStyle.circle,
          compressQuality: 100,
          compressFormat: ImageCompressFormat.png,
          androidUiSettings: const AndroidUiSettings());
      setState(() {
        _imageFile = croppedImage;
      });
    }
  }

  Future<String> _uploadImage(File imageFile, String userId) async {
    final storage = FirebaseStorage.instance;
    try {
      String imagePath = 'avatars/$userId/';
      UploadTask uploadTask = storage.ref().child(imagePath).putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      log('Upload image');
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      // Use the downloadUrl as the avatar URL when updating the user profile
      return downloadUrl;
    } catch (e) {
      log('Error uploading image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      return '';
    }
  }

  Future _createProfile() async {
    final auth = FirebaseAuth.instance;
    String avatarUrl = '';
    if (_imageFile != null) {
      avatarUrl = await _uploadImage(_imageFile!, auth.currentUser!.uid);
    }
    final authService = AuthService();
    UserProfile newProfile = _profile.copyWith(
        avatar: avatarUrl, displayName: _displayNameCtrl.text, bio: _bioCtrl.text);
    authService.saveUserProfile(auth.currentUser?.uid ?? '', newProfile);
    ref.read(userProvider).setUserData(profile: newProfile);

    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title: const Text('Create Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null
                        ? Icon(
                            FluentIcons.person_28_filled,
                            color: Colors.grey.shade400,
                            size: 60,
                          )
                        : null,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _imagePicker,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: const Icon(FluentIcons.image_edit_16_regular),
                        ),
                      ))
                ]),
              ],
            ),
            const SizedBox(height: 22),
            const Text('Display Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _displayNameCtrl,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          hintStyle:
                              TextStyle(color: Colors.black54, fontWeight: FontWeight.normal),
                          hintText: 'Display name',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text('Bio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _bioCtrl,
                      maxLines: 5,
                      maxLength: 100,
                      minLines: 1,
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          hintStyle:
                              TextStyle(color: Colors.black54, fontWeight: FontWeight.normal),
                          hintText: 'Write about you',
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _createProfile,
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 8)),
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  child: const Text(
                    'Save',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MainScreenPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  MainScreenPageRoute({builder}) : super(builder: builder);
}
