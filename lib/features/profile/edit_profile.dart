import 'dart:developer';
import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final _displayNameCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  late String _avatar;
  late final UserProfile _profile;
  File? _imageFile;
  @override
  void initState() {
    super.initState();
    _profile = ref.read(userProvider).profile!;
    _avatar = _profile.avatar;
    _displayNameCtrl.text = _profile.displayName;
    _bioCtrl.text = _profile.bio;
  }

  Future _updateProfile(context) async {
    UserProfile newProfile;
    String avatar = _profile.avatar;
    if (_imageFile != null) {
      //upload firebase
    }
    newProfile =
        _profile.copyWith(avatar: avatar, displayName: _displayNameCtrl.text, bio: _bioCtrl.text);
    final userProfile = ref.read(userProvider);
    userProfile.setUserData(profile: newProfile);
    Navigator.pop(context);
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
      if (croppedImage != null) {
        setState(() {
          _imageFile = croppedImage;
          _avatar = croppedImage.path;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        title:
            const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
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
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : NetworkImage(_avatar) as ImageProvider,
                    child: _avatar.isEmpty
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
                          child: const Icon(FluentIcons.image_add_20_regular),
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
                  onPressed: () => _updateProfile(context),
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
