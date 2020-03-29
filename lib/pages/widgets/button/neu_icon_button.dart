import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class NeuIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const NeuIconButton({Key key, this.icon, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: NeuButton(
        child: Icon(
          icon,
          size: 35,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
