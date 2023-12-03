import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:unsoedfess/features/auth/models/user_model.dart';
import 'package:unsoedfess/features/search/services/serach_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final SearchService _searchService = SearchService();
  Future<List<UserProfile>>? _searchResults;

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
          child: Row(
            children: [
              const Iconify(Bx.search, size: 20, color: Colors.black),
              Expanded(
                child: TextField(
                    autofocus: true,
                    controller: _searchController,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _searchResults = _searchService.findUsersByUsername(value);
                        setState(() {});
                      }
                    },
                    decoration: const InputDecoration(
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
      body: _buildSearchResults(),
    );
  }

  Widget _buildSearchResults() {
    return FutureBuilder<List<UserProfile>>(
      future: _searchResults,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center();
        } else {
          // Display your search results here
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              // Build your list item
              return ListTile(
                leading: CircleAvatar(
                    radius: 40, backgroundImage: NetworkImage(snapshot.data![index].avatar)),
                onTap: () {},
                title: Text(
                  snapshot.data![index].displayName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(snapshot.data![index].username),
                // Add other relevant information
              );
            },
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> findUsersByUsername(String searchTerm) async {
    // Your search query implementation
    // This function should return a list of search results based on the provided searchTerm
    // For simplicity, let's return a dummy list here
    await Future.delayed(const Duration(seconds: 1));
    return [
      {'username': 'user1'},
      {'username': 'user2'},
      // Add more results as needed
    ];
  }
}
