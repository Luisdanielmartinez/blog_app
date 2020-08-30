import 'dart:io';

import 'package:blog_app/src/controllers/postController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUpload extends StatefulWidget {
  @override
  _PhotoUploadState createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File sampleImage;
  String description;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        sampleImage = tempImage;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null ? Text('Select an Image') : enabledUpload(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Add Image',
          child: Icon(Icons.add_a_photo)),
    );
  }

  Widget enabledUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Image.file(
                  sampleImage,
                  height: 300.0,
                  width: 600.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  validator: (value) =>
                      value.isEmpty ? "Description is required" : null,
                  onSaved: (value) {
                    return description = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  elevation: 10.0,
                  child: Text("add a new post"),
                  onPressed: uploadPost,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadPost() async {
    if (validateAndSave()) {
      await Get.find<PostController>().addPost(sampleImage, description);
      Get.back();
      Get.snackbar("Informacion", "Se ha guardado la publicacion.");
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
