import 'package:flutter/material.dart';
import 'package:kourouna/@constants/images.dart';
import 'package:kourouna/pages/widgets/button/cross_button.dart';
import 'package:kourouna/pages/widgets/margin.dart';

class Advice extends StatelessWidget {
  Widget _buildBigCard(BuildContext context, String image, String text) {
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
              style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String image, String text) {
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
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'advice',
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(Images.stay),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      _buildCard(context, Images.washHands,
                          "Lavez-vous très régulierement les mains"),
                      _buildCard(context, Images.stayHome,
                          "Utilisez un mouchoir à usage unique et jetez-le"),
                      _buildCard(context, Images.socialDistance,
                          "Pour tenir la maladie à distance, restez à plus d’un mètre de distance les uns des autres"),
                      _buildCard(context, Images.noGroup,
                          "Toussez ou éternuez dans votre coude ou dans un mouchoir"),
                      _buildCard(context, Images.noGroup,
                          "Saluez sans se serrer la main, pas d'embrassades"),
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
