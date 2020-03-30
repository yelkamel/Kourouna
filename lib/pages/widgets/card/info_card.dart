import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final String image;

  const InfoCard({Key key, this.text, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: NeuCard(
        curveType: CurveType.concave,
        bevel: 12,
        decoration:
            NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: Image.asset(image),
            title: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
