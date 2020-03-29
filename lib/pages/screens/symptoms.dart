import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';
import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/theme.dart';
import 'package:line_icons/line_icons.dart';

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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
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
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      _buildCard(Images.symptomsBodyAche,
                          "Des courbatures sans faire de sport"),
                      _buildCard(Images.symptomsBreath,
                          "Des difficulters à respirer sans être asmathiques"),
                      _buildCard(Images.symptomsFever, "Une fièvre"),
                      _buildCard(Images.symptomsHeadAche,
                          "Des mots de tête incéssant"),
                      _buildCard(Images.symptomsRhume,
                          "Des toux comme si c'était un rhume"),
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
