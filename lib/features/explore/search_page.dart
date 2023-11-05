import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
          child: const Row(
            children: [
              Iconify(Bx.search, size: 20, color: Colors.black),
              Expanded(
                child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      hintText: 'Search',
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
