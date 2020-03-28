import 'package:flutter/material.dart';
import 'package:kourouna/@constants/images.dart';
import 'package:line_icons/line_icons.dart';

import '../../theme/color/light_color.dart';

class SocialDistance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'whattodo',
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset(Images.distance),
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.red,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.close,
                size: 50,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
