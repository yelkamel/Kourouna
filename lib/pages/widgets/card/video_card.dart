import 'package:Kourouna/@constants/lottie.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final String id;

  final String title;
  final String description;
  final String url;
  final String imageUrl;

  const VideoCard(
      {Key key, this.id, this.title, this.description, this.url, this.imageUrl})
      : super(key: key);

  void onTapPlay() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapPlay,
      child: NeuCard(
        curveType: CurveType.concave,
        bevel: 12,
        decoration:
            NeumorphicDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 50),
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
                  description,
                ),
              ),
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(child: Image.network(imageUrl))),
              YMargin(10),
              SizedBox(
                height: 70,
                width: 70,
                child: Lottie.asset(
                  Lotties.play,
                  repeat: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
