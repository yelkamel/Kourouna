import 'package:Kourouna/pages/widgets/button/cross_button.dart';
import 'package:Kourouna/pages/widgets/card/video_card.dart';
import 'package:flutter/material.dart';
import 'package:Kourouna/@constants/images.dart';

import '../../theme/color/light_color.dart';

class Virus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildCard(String image, String text) {
      return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: Image.asset(image),
            title: Text(
              text,
              style: TextStyle(color: AppColors.cyan),
            ),
          ),
        ),
      );
    }

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
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 100),
                    children: [
                      VideoCard(
                        title: 'Cette pandémie, vue depuis 2021 - DBY #67',
                        subTitle: "Le prof de SVT",
                        url:
                            'https://www.youtube.com/watch?v=bM7AOBxqjnE&t=910s',
                        miniatureUrl:
                            "http://i1.ytimg.com/vi/bM7AOBxqjnE/maxresdefault.jpg",
                      ),
                      VideoCard(
                        title: "CORONAVIRUS : PEUT-ON L'AVOIR DEUX FOIS ?",
                        subTitle: "Wesh wesh les zamis",
                        url: 'https://www.youtube.com/watch?v=OhMOe8uncB8',
                        miniatureUrl:
                            "http://i1.ytimg.com/vi/OhMOe8uncB8/mqdefault.jpg",
                      ),
                      VideoCard(
                        title: 'Éthique médicale au temps du COVID-19',
                        subTitle: "Vu par le prof de philo",
                        url: 'https://www.youtube.com/watch?v=CaaEGtFH4FE',
                        miniatureUrl:
                            "http://i1.ytimg.com/vi/CaaEGtFH4FE/mqdefault.jpg",
                      ),
                      VideoCard(
                        title:
                            'Coronavirus et Covid19 : quels risques pour votre santé ?',
                        subTitle: "Ce qu'en dit un medecin",
                        url: 'https://www.youtube.com/watch?v=pYBETWfFYhw',
                        miniatureUrl:
                            "http://i1.ytimg.com/vi/pYBETWfFYhw/maxresdefault.jpg",
                      ),
                      VideoCard(
                        title: 'CORONAVIRUS : RESTEZ CHEZ VOUS !',
                        subTitle: "Tout est dans le titre",
                        url: 'https://www.youtube.com/watch?v=E18IvjXR4nk',
                        miniatureUrl:
                            "http://i1.ytimg.com/vi/E18IvjXR4nk/maxresdefault.jpg",
                      ),
                    ],
                  ),
                ),
              ),
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
