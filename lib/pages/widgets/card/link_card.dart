import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  final String url;
  final String title;

  const LinkCard({Key key, this.url, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
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
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
