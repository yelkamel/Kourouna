import 'package:flutter/material.dart';
import 'package:kourouna/theme/color/light_color.dart';

class CrossButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
            size: 40,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.red,
              blurRadius: 15,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
