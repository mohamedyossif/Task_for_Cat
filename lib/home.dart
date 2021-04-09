import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int imageId = 1;
// create iconButton
  IconButton iconButton({iconData, double buttonSize, onPress}) {
    return IconButton(
      icon: Icon(
        iconData,
      ),
      iconSize: buttonSize,
      onPressed: () {
        if (onPress) {
          setState(() {
            imageId = Random().nextInt(12) + 1; //(0:11)+1 = (1:12)
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/image$imageId.jpg',
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        Positioned(
          child: Container(
            color: Colors.green[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconButton(
                  iconData: Icons.repeat,
                  buttonSize: 50,
                ),
                iconButton(
                  iconData: Icons.skip_previous_rounded,
                  buttonSize: 50,
                ),
                iconButton(
                  iconData: Icons.play_circle_fill_outlined,
                  buttonSize: 50,
                  onPress: true,
                ),
                iconButton(
                  iconData: Icons.skip_next_rounded,
                  buttonSize: 50,
                ),
                iconButton(
                  iconData: Icons.shuffle_rounded,
                  buttonSize: 50,
                ),
              ],
            ),
          ),
          bottom: 0,
          right: 0,
          left: 0,
        ),
      ],
    );
  }
}
