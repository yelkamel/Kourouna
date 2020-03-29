import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/button/neu_icon_button.dart';
import 'package:Kourouna/pages/widgets/card/video_card.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';
import 'package:line_icons/line_icons.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:swipe_stack/swipe_stack.dart';

import '../../theme/color/light_color.dart';

const List<Widget> VideoWidgets = [
  VideoCard(
    id: 'wesh',
    title: 'Cette pandémie, vue depuis 2021 - DBY #67',
    description: "Le prof de SVT",
    url: 'https://www.youtube.com/watch?v=bM7AOBxqjnE&t=910s',
    imageUrl: "http://i1.ytimg.com/vi/bM7AOBxqjnE/maxresdefault.jpg",
  ),
  VideoCard(
    id: 'weswesh',
    title: "CORONAVIRUS : PEUT-ON L'AVOIR DEUX FOIS ?",
    description: "Wesh wesh les zamis",
    url: 'https://www.youtube.com/watch?v=OhMOe8uncB8',
    imageUrl: "http://i1.ytimg.com/vi/OhMOe8uncB8/mqdefault.jpg",
  ),
  VideoCard(
    id: 'phi',
    title: 'Éthique médicale au temps du COVID-19',
    description: "Vu par le prof de philo",
    url: 'https://www.youtube.com/watch?v=CaaEGtFH4FE',
    imageUrl: "http://i1.ytimg.com/vi/CaaEGtFH4FE/mqdefault.jpg",
  ),
  VideoCard(
    id: 'lemonde',
    title: 'Coronavirus et Covid19 : quels risques pour votre santé ?',
    description: "Ce qu'en dit un medecin",
    url: 'https://www.youtube.com/watch?v=pYBETWfFYhw',
    imageUrl: "http://i1.ytimg.com/vi/pYBETWfFYhw/maxresdefault.jpg",
  ),
  VideoCard(
    id: 'rirejaune',
    title: 'CORONAVIRUS : RESTEZ CHEZ VOUS !',
    description: "Tout est dans le titre",
    url: 'https://www.youtube.com/watch?v=E18IvjXR4nk',
    imageUrl: "http://i1.ytimg.com/vi/E18IvjXR4nk/maxresdefault.jpg",
  ),
];

class VideoSwiper extends StatelessWidget {
  final GlobalKey<SwipeStackState> _swipeKey = GlobalKey<SwipeStackState>();

  Widget _buildContent() {
    return SwipeStack(
      key: _swipeKey,
      children: [0, 1, 2, 3, 4].map((int index) {
        return SwiperItem(builder: (SwiperPosition position, double progress) {
          return VideoWidgets[index];
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

  @override
  Widget build(BuildContext context) {
    final Function hp = Screen(context).hp;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
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
                child: _buildContent(),
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
