import 'dart:io';
import 'package:blog_app/src/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class PostService {
  final postReference = Firestore.instance.collection('posts');

  Stream<List<Post>> getPosts() {
    return postReference.snapshots().map((event) {
      return event.documents.map((e) => Post.postFromSnapshot(e)).toList();
    });
  }

  Future<void> putPost(File image, String description) async {
    final StorageReference postImageRef =
        FirebaseStorage.instance.ref().child('Post Image');
    var timekey = DateTime.now();

    final StorageUploadTask uploadTask =
        postImageRef.child(timekey.toString() + ".jpg").putFile(image);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    var url = imageUrl.toString();

    //save post

    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE hh:mm aaa');

    String date = formatDate.format(timekey);
    String time = formatTime.format(timekey);

    postReference.document().setData(
        {'image': url, 'description': description, 'date': date, 'time': time});
  }
}
