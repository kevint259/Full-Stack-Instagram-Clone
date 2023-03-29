import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: TextFormField(
            decoration: const InputDecoration(
              labelText: "Search for a user",
            ),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
            },
          ),
        ),
        body: isShowUsers
            ? FutureBuilder(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                            snapshot.data!.docs[index]['photoUrl'],
                          )),
                          title: Text(
                            snapshot.data!.docs[index]['username'],
                          ));
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                },
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where('username',
                        isGreaterThanOrEqualTo: _searchController.text)
                    .get())
            : const Text("Posts"));
  }
}
