import 'package:kourouna/@constants/images.dart';
import 'package:kourouna/pages/widgets/information_title_card.dart';
import 'package:kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: InformationTitleCard(
                  image: Images.virus,
                  subTitle: 'Comment il se propage ?',
                  title: 'De la manière la plus vil',
                  tag: 'virus',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/virus');
                },
              ),
              SizedBox(height: hp(3)),
              GestureDetector(
                child: InformationTitleCard(
                  image: Images.advice,
                  subTitle: 'Les symptomes du virus ?',
                  title: 'Fièvre, mots de gorge, fatigue, tout ',
                  tag: 'symptoms',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/symptoms');
                },
              ),
              SizedBox(height: hp(3)),
              GestureDetector(
                child: InformationTitleCard(
                  image: Images.stay,
                  subTitle: 'Que dois-t-on faire ?',
                  title: 'Des astuces pour gagner la guerre',
                  tag: 'whattodo',
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/advice');
                },
              ),
              SizedBox(height: hp(3)),
              GestureDetector(
                child: InformationTitleCard(
                    image: Images.distance,
                    subTitle: 'les endroits safe ou sortir ?',
                    title: 'Les cas près de chez moi',
                    tag: 'wheretogo'),
                onTap: () {
                  Navigator.of(context).pushNamed('/distance');
                },
              ),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
