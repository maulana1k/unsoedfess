import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

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
          height: 36,
          decoration:
              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
          child: const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(FluentIcons.search_32_regular, size: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
      body: const Center(),
    );
  }
}
