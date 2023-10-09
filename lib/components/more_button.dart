import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
          decoration:
              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
          child: const Icon(FluentIcons.more_horizontal_16_regular)),
    );
  }
}
