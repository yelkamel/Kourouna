import 'package:Kourouna/@constants/images.dart';
import 'package:Kourouna/navigation/slide_page_route.dart';
import 'package:Kourouna/pages/screens/advice.dart';
import 'package:Kourouna/pages/screens/map_info.dart';
import 'package:Kourouna/pages/screens/symptoms.dart';
import 'package:Kourouna/pages/screens/video_swiper.dart';
import 'package:Kourouna/pages/widgets/information_title_card.dart';
import 'package:Kourouna/pages/widgets/margin.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Function wp = Screen(context).wp;
    final Function hp = Screen(context).hp;
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              InformationTitleCard(
                image: Images.virus,
                subTitle: "Que sait-on en ce moment ? ",
                title: "Le CodVID19, le Corona",
                tag: 'virus',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(SlidePageRoute(
                    screen: VideoSwiper(),
                  ));
                },
              ),
              SizedBox(height: hp(3)),
              InformationTitleCard(
                image: Images.advice,
                subTitle: 'Les symptomes du virus ?',
                title: 'Fièvre, mots de gorge, fatigue, tout ',
                tag: 'symptoms',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(SlidePageRoute(
                    screen: Symptoms(),
                  ));
                },
              ),
              SizedBox(height: hp(3)),
              InformationTitleCard(
                image: Images.stay,
                subTitle: 'Que dois-t-on faire ?',
                title: 'Des astuces pour gagner la guerre',
                tag: 'stayhome',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(SlidePageRoute(
                    screen: Advice(),
                  ));
                },
              ),
              SizedBox(height: hp(3)),
              InformationTitleCard(
                image: Images.distance,
                subTitle: 'Ou peut-on sortir ?',
                title: 'Les cas près de chez moi',
                tag: 'distance',
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(SlidePageRoute(
                    screen: MapInfo(),
                  ));
                },
              ),
              YMargin(40)
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
