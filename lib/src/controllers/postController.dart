import 'dart:io';

import 'package:blog_app/src/models/post_model.dart';
import 'package:blog_app/src/services/postService.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  Rx<List<Post>> postList = Rx<List<Post>>();

  List<Post> get getPost => postList.value;

  @override
  void onInit() {
    //stream coming from firebase
    postList.bindStream(PostService().getPosts());
  }

  Future<void> addPost(File image, String description) async {
    await PostService().putPost(image, description);
  }
}
