import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class AvatarProfile extends ConsumerWidget {
  final double radius;
  const AvatarProfile({super.key, this.radius = 50});

  @override
  Widget build(BuildContext context, ref) {
    final avatarUrl = ref.read(userProvider).profile?.avatar;
    return avatarUrl!.isEmpty
        ? CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey.shade200,
            child:
                Icon(FluentIcons.person_12_filled, size: radius + 10, color: Colors.grey.shade400),
          )
        : CircleAvatar(radius: radius, backgroundImage: NetworkImage(avatarUrl));
  }
}
