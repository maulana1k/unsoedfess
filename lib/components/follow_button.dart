import 'dart:ui';
import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
  });

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollow = false;
  void _followAction() {
    if (_isFollow) {
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
                                child: Text('Add to favorite',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                            Divider(height: 0, color: Colors.grey.shade300),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                child: Text('Mute',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                            Divider(height: 0, color: Colors.grey.shade300),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Text('Unfollow',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          });
    } else {
      setState(() {
        _isFollow = !_isFollow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _followAction,
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: _isFollow ? Colors.grey.shade200 : Colors.black,
              borderRadius: BorderRadius.circular(20)),
          child: Text(_isFollow ? 'Following' : 'Follow',
              style: TextStyle(
                color: _isFollow ? null : Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
