import 'package:Kourouna/@constants/lotties.dart';
import 'package:Kourouna/models/video_model.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key key, this.video}) : super(key: key);

  void onTapPlay() async {
    if (await canLaunch(video.url)) {
      await launch(video.url);
    } else {
      throw 'Could not launch $video.url';
    }
  }

  Widget _buildImage() {
    if (video.type == 'tuto') {
      return SizedBox(
        height: 70,
        width: 70,
        child: Lottie.asset(
          Lotties.think,
          repeat: true,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(video.imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      curveType: CurveType.concave,
      bevel: 12,
      decoration: NeumorphicDecoration(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTapPlay,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    video.title,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    video.description,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            ClipRect(
              child: AspectRatio(aspectRatio: 16 / 9, child: _buildImage()),
            )
          ],
        ),
      ),
    );
  }
}

/*             
              )*/
