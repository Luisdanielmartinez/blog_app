import 'package:blog_app/src/models/post_model.dart';
import 'package:flutter/material.dart';

class PostUI extends StatefulWidget {
  Post post;
  PostUI({this.post});
  @override
  _PostUIState createState() => _PostUIState(post: post);
}

class _PostUIState extends State<PostUI> {
  Post post;
  _PostUIState({this.post});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  post.date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  post.time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Image.network(
              post.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            Text(
              post.description,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
