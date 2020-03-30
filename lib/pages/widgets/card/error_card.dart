import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      margin: EdgeInsets.all(40),
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () async {},
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8,
              ),
              child: ListTile(
                title: Text(
                  "Une erreur est survenue... 🙁",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
