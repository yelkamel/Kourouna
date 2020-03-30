import 'package:Kourouna/@constants/dimensions.dart';
import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';

class TopIllusion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: AppColors.cyan,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
