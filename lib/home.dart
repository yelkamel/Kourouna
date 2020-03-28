import 'package:kourouna/pages/tabs/home.dart';
import 'package:kourouna/pages/tabs/information.dart';
import 'package:kourouna/pages/tabs/settings.dart';
import 'package:kourouna/pages/widgets/margin.dart';
import 'package:kourouna/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'blocs/blocs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;

  void addPostFrameCallback(FrameCallback callback) {
    // Load data on widget load
    print('relad?');
    BlocProvider.of<CaseBloc>(context).add(FetchCase());
  }

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        InformationScreen(),
        HomeScreen(),
        SettingsPage(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(),
            ),
            YMargin(10),
            Expanded(child: buildPageView())
          ])),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10).add(EdgeInsets.only(top: 5)),
            child: GNav(
                gap: 10,
                activeColor: Colors.white,
                color: Colors.grey[400],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.list_ul,
                    text: 'Guides',
                    backgroundColor: AppColors.red,
                  ),
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    backgroundColor: AppColors.red,
                  ),
                  GButton(
                    icon: LineIcons.cog,
                    text: 'Settings',
                    backgroundColor: AppColors.red,
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    pageController.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
