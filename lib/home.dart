import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int imageId = 1;
  int isCheck = 1;
  var player = AudioCache();

// create iconButton
  IconButton iconButtons({IconData iconData, Function onPress}) {
    return IconButton(
        icon: Icon(
          iconData,
          color: Colors.red,
        ),
        iconSize: 50,
        onPressed: onPress);
  }

  Function click() {
    isCheck = imageId;
    return () {
      imageId = Random().nextInt(5) + 1;
      // to prevent image duplication
      if (isCheck != imageId) {
        setState(() {});
      } else {
        setState(() {
          imageId = imageId % 5 + 1;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 530,
          width: 450,
          child: Image.asset(
            'assets/images/image$imageId.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: Colors.green[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconButtons(
                iconData: Icons.repeat,
              ),
              iconButtons(
                iconData: Icons.skip_previous_rounded,
                onPress: click(),
              ),
              iconButtons(
                  iconData: Icons.play_circle_fill_outlined,
                  onPress: () {
                    setState(() {
                      player.play('sad.mp3');
                    });
                  }),
              iconButtons(
                iconData: Icons.skip_next_rounded,
                onPress: click(),
              ),
              iconButtons(
                iconData: Icons.shuffle_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
