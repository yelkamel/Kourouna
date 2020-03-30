import 'package:Kourouna/models/video_model.dart';
import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/button/neu_icon_button.dart';
import 'package:Kourouna/pages/widgets/card/video_card.dart';
import 'package:Kourouna/pages/widgets/kou_loader.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:Kourouna/pages/widgets/top_illussion.dart';
import 'package:Kourouna/service/database.dart';
import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:swipe_stack/swipe_stack.dart';

class VideoSwiper extends StatelessWidget {
  final GlobalKey<SwipeStackState> _swipeKey = GlobalKey<SwipeStackState>();

  Widget _buildStack(List<Video> videos) {
    return SwipeStack(
      key: _swipeKey,
      children: videos.map((Video vid) {
        return SwiperItem(builder: (SwiperPosition position, double progress) {
          return VideoCard(video: vid);
        });
      }).toList(),
      visibleCount: 4,
      stackFrom: StackFrom.Top,
      translationInterval: 9,
      scaleInterval: 0.09,
      onEnd: () => debugPrint("onEnd"),
      onSwipe: (int index, SwiperPosition position) =>
          debugPrint("onSwipe $index $position"),
      onRewind: (int index, SwiperPosition position) =>
          debugPrint("onRewind $index $position"),
    );
  }

  Widget _buildContent(BuildContext context) {
    final Database database = Provider.of<Database>(context);

    return StreamBuilder<List<Video>>(
      stream: database.videoStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return KouLoader();
        }
        if (snapshot.data.length == 0) {
          return Container();
        }

        List<Video> videos = snapshot.data;
        return _buildStack(videos);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Function hp = Screen(context).hp;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 10,
            child: TopIllusion(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'virus',
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(Images.virus),
                ),
              ),
              YMargin(10),
              Container(
                height: hp(50),
                child: _buildContent(context),
              ),
              Container(
                height: hp(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NeuIconButton(
                      onPressed: () {
                        _swipeKey.currentState.swipeLeft();
                      },
                      icon: Icons.mood_bad,
                    ),
                    SizedBox(width: 150),
                    NeuIconButton(
                      onPressed: () {
                        _swipeKey.currentState.swipeRight();
                      },
                      icon: Icons.check,
                    )
                  ],
                ),
              )
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
