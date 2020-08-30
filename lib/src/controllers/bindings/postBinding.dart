import 'package:blog_app/src/controllers/postController.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController(), permanent: true);
  }
}
