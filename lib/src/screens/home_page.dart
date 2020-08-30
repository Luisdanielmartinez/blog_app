import 'package:blog_app/src/controllers/postController.dart';
import 'package:blog_app/src/screens/photo_upload_page.dart';
import 'package:blog_app/src/widgets/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PhotoUpload());
        },
        child: Icon(Icons.add),
        tooltip: 'Add Post',
      ),
      body: SafeArea(
          child: GetX<PostController>(
        init: Get.put<PostController>(PostController()),
        builder: (PostController postController) {
          if (postController != null && postController.getPost != null) {
            return ListView.builder(
              itemCount: postController.getPost.length,
              itemBuilder: (context, index) {
                return PostUI(post: postController.getPost[index]);
              },
            );
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      )),
    );
  }
}
