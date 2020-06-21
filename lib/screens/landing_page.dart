import 'package:flutter/material.dart';
import 'package:task3/utils/colors.dart';
import 'package:task3/utils/string_utils.dart';
import 'package:task3/screens/home.dart';
import 'package:task3/screens/favorite.dart';
import 'package:task3/screens/account.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController(
    initialPage: 0,
  );

  //Initiating Bottom Navigation Bar
  int bottomSelectedIndex = 0;

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringUtils.appTitle,
            style: TextStyle(color: ColorUtils.iconColor),
          ),
        ),
        backgroundColor: ColorUtils.appBackgroundColor,
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: <Widget>[
            Home(),
            Favourite(),
            Account(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: ColorUtils.appBackgroundColor),
              title: Text(StringUtils.homeTitle,
                  style: TextStyle(color: ColorUtils.appBackgroundColor)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: ColorUtils.appBackgroundColor),
              title: Text(StringUtils.favTitle,
                  style: TextStyle(color: ColorUtils.appBackgroundColor)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: ColorUtils.appBackgroundColor),
              title: Text(StringUtils.accountTitle,
                  style: TextStyle(color: ColorUtils.appBackgroundColor)),
            ),
          ],
          backgroundColor: ColorUtils.iconColor,
        ),
      ),
    );
  }
}
