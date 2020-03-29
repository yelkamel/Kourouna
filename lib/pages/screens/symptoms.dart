import 'package:Kourouna/pages/widgets/card/info_card.dart';
import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';
import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:neumorphic/neumorphic.dart';

import '../../theme/color/light_color.dart';

class Symptoms extends StatelessWidget {
  Widget _buildBigCard(String image, String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(height: 90, child: Image.asset(image)),
            YMargin(8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: HexColor.fromHex('#000091')),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String image, String text) {
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
              style: TextStyle(color: AppColors.cyan),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'symptoms',
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(Images.advice),
                ),
              ),
              YMargin(10),
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      InfoCard(
                        text: "Des courbatures sans faire de sport",
                        image: Images.symptomsBodyAche,
                      ),
                      InfoCard(
                        text: "Des courbatures sans faire de sport",
                        image: Images.symptomsBreath,
                      ),
                      InfoCard(
                        text: "Des courbatures sans faire de sport",
                        image: Images.symptomsFever,
                      ),
                      InfoCard(
                        text: "Des courbatures sans faire de sport",
                        image: Images.symptomsHeadAche,
                      ),
                      InfoCard(
                        text: "Des courbatures sans faire de sport",
                        image: Images.symptomsRhume,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CrossButton(),
          )
        ]),
      ),
    );
  }
}
