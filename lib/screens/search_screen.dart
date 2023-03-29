import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/utils/global_variables.dart';

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
                    return InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProfileScreen(uid: snapshot.data!.docs[index]['uid']))),
                      child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                            snapshot.data!.docs[index]['photoUrl'],
                          )),
                          title: Text(
                            snapshot.data!.docs[index]['username'],
                          )),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              },
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('username',
                      isGreaterThanOrEqualTo: _searchController.text)
                  .get())
          : FutureBuilder(
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) =>
                      Image.network(snapshot.data!.docs[index]['postUrl']),
                  staggeredTileBuilder: (int index) => MediaQuery.of(context).size.width > webScreenSize ? StaggeredTile.count(
                      (index & 7 == 0) ? 1 : 1, (index & 7 == 0) ? 1 : 1) : StaggeredTile.count(
                      (index & 7 == 0) ? 2 : 1, (index & 7 == 0) ? 2 : 1),
                );
              },
              future: FirebaseFirestore.instance.collection('posts').get(),
            ),
    );
  }
}
