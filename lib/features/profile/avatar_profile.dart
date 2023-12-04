import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class AvatarProfile extends ConsumerWidget {
  final double radius;
  final String avatarUrl;
  const AvatarProfile({super.key, this.radius = 50, required this.avatarUrl});

  @override
  Widget build(BuildContext context, ref) {
    return avatarUrl.isEmpty
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
