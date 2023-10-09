import 'dart:ui';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration:
            BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
        child: const Icon(FluentIcons.mail_16_regular),
        // child: const Text('Message',
        //     style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      ),
    );
  }
}
