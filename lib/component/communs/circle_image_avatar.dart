import 'package:flutter/material.dart';

const AssetImage _defaultImage = AssetImage("assets/images/default_image.png");


class CircleAvatarImage extends StatelessWidget {
  Image image;

  CircleAvatarImage(this.image);

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
        image == null ? _defaultImage : image.image,
      ),
    );
  }
}
