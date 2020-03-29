import 'package:Kourouna/theme/color/light_color.dart';
import 'package:Kourouna/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:responsive_screen/responsive_screen.dart';

class InformationTitleCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String tag;
  final Function onPressed;

  const InformationTitleCard({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.image,
    @required this.onPressed,
    this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //  final Function wp = Screen(context).wp;
    //  final Function hp = Screen(context).hp;
    return NeuButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(10),
      child: Container(
        child: ListTile(
          leading: Hero(
            tag: tag,
            child: Container(
              width: 50,
              height: 50,
              child: Image.asset(
                image,
              ),
            ),
          ),
          title: Text(title,
              style: AppTheme.h2Style.copyWith(
                  color: LightColor.darkgrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          subtitle: Text(
            subTitle,
            style: AppTheme.h2Style.copyWith(
                color: LightColor.darkgrey.withOpacity(0.5), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
