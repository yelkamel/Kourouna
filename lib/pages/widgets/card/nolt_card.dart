import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoltCard extends StatelessWidget {
  String url = 'https://kourouna.nolt.io/';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Theme.of(context).cardTheme.margin,
      shape: Theme.of(context).cardTheme.shape,
      elevation: Theme.of(context).cardTheme.elevation,
      color: Theme.of(context).cardTheme.color,
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
                  "Une sugestion pour l'application ?",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'Apercu',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
