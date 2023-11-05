import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatefulWidget {
  const MessageButton({
    super.key,
  });

  @override
  State<MessageButton> createState() => _MessageButtonState();
}

class _MessageButtonState extends State<MessageButton> {
  void _openMessageMenu() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade200,
                        )),
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 10),
                        child: Text('felicia.angel_',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Text('Message as felicia.angel_',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                          Divider(height: 0, color: Colors.grey.shade300),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Message as Anonym',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text(
                                    'They cannot reply your message',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: _openMessageMenu,
        style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            side: MaterialStateProperty.all(const BorderSide(color: Colors.transparent)),
            overlayColor: MaterialStateProperty.all(Colors.grey.shade400),
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200)),
        child: const Icon(FluentIcons.mail_16_regular, color: Colors.black));
  }
}
