import 'package:flutter/material.dart';

class Sizes{

  Size size;
  static double movieTileHeight;
  static double movieTileWidth;
  static const EdgeInsetsGeometry tilePadding = EdgeInsets.all(12);
  void init(BuildContext context){
    size = MediaQuery.of(context).size;
    movieTileHeight = size.height / 2.2;
    movieTileWidth = size.width / 2.2;
  }
}