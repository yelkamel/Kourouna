import 'package:Kourouna/pages/widgets/card/info_card.dart';
import 'package:Kourouna/pages/widgets/top_illussion.dart';
import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';
import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:neumorphic/neumorphic.dart';

class Advice extends StatelessWidget {
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
              TopIllusion(),
              Hero(
                tag: 'stayhome',
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(Images.stay),
                ),
              ),
              YMargin(10),
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      InfoCard(
                        text: "Lavez-vous très régulierement les mains",
                        image: Images.stayHome,
                      ),
                      InfoCard(
                        text: "Utilisez un mouchoir à usage unique et jetez-le",
                        image: Images.socialDistance,
                      ),
                      InfoCard(
                        text:
                            "Pour tenir la maladie à distance, restez à plus d’un mètre de distance les uns des autres",
                        image: Images.socialDistance,
                      ),
                      InfoCard(
                        text:
                            "Toussez ou éternuez dans votre coude ou dans un mouchoir",
                        image: Images.socialDistance,
                      ),
                      InfoCard(
                        text:
                            "Saluez sans se serrer la main, pas d'embrassades",
                        image: Images.nohandshake,
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
