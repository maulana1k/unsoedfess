import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class AvatarProfile extends ConsumerWidget {
  final double radius;
  const AvatarProfile({super.key, this.radius = 50});

  @override
  Widget build(BuildContext context, ref) {
    final avatarUrl = ref.read(userProvider).profile?.avatar;
    return avatarUrl!.isEmpty
        ? AvatarPlaceholder(radius: radius)
        : CircleAvatar(radius: radius, backgroundImage: NetworkImage(avatarUrl));
  }
}

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade200,
      child: Iconify(Bx.user, size: radius + 5, color: Colors.grey.shade400),
    );
  }
}
