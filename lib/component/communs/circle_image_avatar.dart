import 'package:flutter/material.dart';

const AssetImage _defaultImage = AssetImage("assets/images/default_image.png");


class CircleAvatarImage extends StatefulWidget {
  Image _final;

  CircleAvatarImage(this._final);

  @override
  State<StatefulWidget> createState() {
    return __CircleAvatarImageState();
  }
}

class __CircleAvatarImageState extends State<CircleAvatarImage> {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 62,
      backgroundColor: Colors.blue,
      child: CircleAvatar(
        radius: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Icon(
            Icons.camera_enhance,
            color: Colors.white,
          ),
        ),
        backgroundImage:
        widget._final == null ? _defaultImage : widget._final.image,
      ),
    );
  }
}
