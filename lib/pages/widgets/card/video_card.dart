import 'package:Kourouna/models/video_model.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
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
            ListTile(
              title: Text(
                video.title,
                style: TextStyle(color: AppColors.cyan),
              ),
              subtitle: Text(
                video.description,
              ),
            ),
            ClipRect(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*              SizedBox(
                height: 70,
                width: 70,
                child: Lottie.asset(
                  Lotties.play,
                  repeat: false,
                ),
                
              )*/
