import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String url;
  final String miniatureUrl;

  const VideoCard(
      {Key key, this.title, this.subTitle, this.url, this.miniatureUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: InkWell(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(color: AppColors.cyan),
                ),
                subtitle: Text(
                  subTitle,
                ),
              ),
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(child: Image.network(miniatureUrl))),
              ButtonBar(
                children: <Widget>[
                  Icon(Icons.play_circle_filled,
                      color: Theme.of(context).primaryColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
