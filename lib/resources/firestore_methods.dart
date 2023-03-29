import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/posts.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // upload post
  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = 'Some error occurred';
    try {
      // retrieve downloaded photo URL of selected picture
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);

      // create UUID for each unique post
      String postId = const Uuid().v1();

      // uploading to firestore
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profImage,
          likes: []);
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // LIKE POST
  Future<void> likePost(String postId, String uid, List likes) async {
    String res = 'Some error occurred';
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    }catch (e) {
      print(e.toString());
    }
  }
  // POST COMMENT
  Future<void> postComment(String postId, String text, String uid, String name, String profilePic) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
      } else {
        print("Text is empty");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // DELETING POST
  Future<void> deletePost(String postId) async {
    try {
      _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // Follow User
  



}
