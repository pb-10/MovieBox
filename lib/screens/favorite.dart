import 'package:flutter/material.dart';
import 'package:task3/utils/colors.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "No Favorites added yet",
                style: TextStyle(color: ColorUtils.iconColor),
              ),
            ),
          ],
        ),
        backgroundColor: ColorUtils.appBackgroundColor
    );
  }
}
