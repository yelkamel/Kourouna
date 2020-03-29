import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareCard extends StatelessWidget {
  const ShareCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          Share.share('check out my website https://example.com',
              subject: 'Look what I made!');
        },
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8,
                ),
                child: ListTile(
                    title: Text(
                      "Patager l'application",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.share))),
          ],
        ),
      ),
    );
  }
}
