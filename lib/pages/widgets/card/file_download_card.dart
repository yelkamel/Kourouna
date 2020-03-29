import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class FileDownloadCard extends StatelessWidget {
  String urldoc1 =
      'https://www.gouvernement.fr/sites/default/files/cfiles/attestation-deplacement-fr-20200324.pdf';
  String urldoc2 =
      'https://www.gouvernement.fr/sites/default/files/cfiles/justificatif-deplacement-professionnel-fr.pdf';
  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.flat,
      bevel: 8,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15),
              child: Text(
                "Documents",
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8,
            ),
            child: InkWell(
              onTap: () async {
                if (await canLaunch(urldoc1)) {
                  await launch(urldoc1);
                } else {
                  throw 'Could not launch $urldoc1';
                }
              },
              child: ListTile(
                title: Text(
                  "Dérogation exceptionel",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8,
            ),
            child: InkWell(
              onTap: () async {
                if (await canLaunch(urldoc1)) {
                  await launch(urldoc1);
                } else {
                  throw 'Could not launch $urldoc1';
                }
              },
              child: ListTile(
                title: Text(
                  "Dérogation professionel",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          )
        ],
      ),
    );
  }
}
