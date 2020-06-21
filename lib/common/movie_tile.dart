import 'package:flutter/material.dart';
import 'package:task3/utils/colors.dart';
import 'package:task3/utils/sizes.dart';

class MovieTile extends StatelessWidget {
  final String asset;
  final String movieTitle;
  final String movieGenre;
  final String ratingNumber;
  final TextStyle textStyle = const TextStyle(
    color: ColorUtils.iconColor,
    fontSize: 12,
  );

  const MovieTile({
    Key key,
    this.asset,
    this.movieTitle,
    this.movieGenre,
    this.ratingNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMovieDialog(context),
      child: Container(
        width: Sizes.movieTileWidth,
        height: Sizes.movieTileHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  asset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movieTitle,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  movieGenre,
                  style: textStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Ratings:",
                      style: textStyle,
                    ),
                    SizedBox(
                      width: 48,
                    ),
                    Icon(
                      Icons.star_border,
                      color: ColorUtils.iconColor,
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      ratingNumber,
                      style: textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showMovieDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Text(
              movieTitle,
              style: textStyle,
                overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              movieGenre,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Ratings:",
                  style: textStyle,
                ),
                SizedBox(
                  width: 54,
                ),
                Icon(
                  Icons.star_border,
                  color: ColorUtils.iconColor,
                  size: 20,
                ),
                Text(
                  ratingNumber,
                  style: textStyle,
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(
                    Icons.favorite_border,
                    color: ColorUtils.appBackgroundColor,
                  ),
                  backgroundColor: ColorUtils.iconColor,
                  onPressed: (){},
                ),
                SizedBox(
                  width: 16,
                ),
                FloatingActionButton(
                  child: Icon(
                    Icons.play_circle_filled,
                    color: ColorUtils.appBackgroundColor,
                  ),
                  backgroundColor: ColorUtils.iconColor,
                  onPressed: (){},
                ),
              ],
            ),
          ],
          elevation: 50,
          backgroundColor: ColorUtils.appBackgroundColor,
        );
      },
    );
  }
}