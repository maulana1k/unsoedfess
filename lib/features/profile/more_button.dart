import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatefulWidget {
  const MoreButton({
    super.key,
  });

  @override
  State<MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<MoreButton> {
  void _openMoreMenu() {
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
                              child: Text('Share Profile',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                          Divider(height: 0, color: Colors.grey.shade300),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Text('Block',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red))),
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
    return IconButton(
      onPressed: _openMoreMenu,
      // customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      icon: const Icon(FluentIcons.more_vertical_28_filled),
    );
  }
}
