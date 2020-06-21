import 'package:flutter/material.dart';
import 'package:task3/utils/colors.dart';
import 'package:task3/utils/sizes.dart';
import 'package:task3/common/movie_tile.dart';
import 'dart:convert';
import 'package:task3/utils/movie_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive, we need to
  // calculate the screen height
  Map<String, dynamic> map = {
    "moviesLists": [
      {
        "image": "images/coco.jpg",
        "title": "Coco",
        "genre": "Animation, Adventure, Family",
        "rating": "8.4"
      },
      {
        "image": "images/incredibles.jpg",
        "title": "The Incredibles 2",
        "genre": "Animation, Action, Family",
        "rating": "7.6"
      },
      {
        "image": "images/toy.jpg",
        "title": "Toy Story 4",
        "genre": "Animation, Comedy, Adventure",
        "rating": "7.8"
      },
      {
        "image": "images/up.jpg",
        "title": "Up",
        "genre": "Animation, Comedy, Adventure",
        "rating": "8.2"
      }
    ],
  };

  Map<String, dynamic> map2 = {
    "moviesLists": [
      {
        "image": "images/parasite.jpg",
        "title": "Parasite",
        "genre": "Thriller, Comedy, Drama",
        "rating": "8.6",
      },
      {
        "image": "images/1917.jpg",
        "title": "1917",
        "genre": "Drama, War",
        "rating": "8.4",
      },
      {
        "image": "images/joker.jpg",
        "title": "Joker",
        "genre": "Crime, Drama, Thriller",
        "rating": "8.5",
      },
      {
        "image": "images/fvf.jpg",
        "title": "Ford V Ferrari",
        "genre": "Biography, Action, Drama",
        "rating": "8.1",
      }
    ],
  };
  Map<String, dynamic> map3 = {
    "moviesLists": [
      {
        "image": "images/avengers.jpg",
        "title": "The Avengers",
        "genre": "Action, Adventure, Sci-Fi",
        "rating": "8.0",
      },
      {
        "image": "images/ultron.jpg",
        "title": "Avengers: Age Of Ultron",
        "genre": "Action, Adventure, Sci-Fi",
        "rating": "7.3",
      },
      {
        "image": "images/infinity.jpg",
        "title": "Avengers: Infinity War",
        "genre": "Action, Adventure, Sci-Fi",
        "rating": "8.5",
      },
      {
        "image": "images/endgame.jpg",
        "title": "Avengers: Endgame",
        "genre": "Action, Adventure, Sci-Fi",
        "rating": "8.4",
      }
    ],
  };
  Map<String, dynamic> map4 = {
    "moviesLists": [
      {
        "image": "images/dh2.jpg",
        "title": "Harry Potter and The Deathly Hallows 2",
        "genre": "Adventure, Drama, Fantasy",
        "rating": "8.1",
      },
      {
        "image": "images/azkaban.jpg",
        "title": "Harry Potter and The Prisoner of Azkaban",
        "genre": "Adventure, Family, Fantasy",
        "rating": "7.9",
      },
      {
        "image": "images/goblet.jpg",
        "title": "Harry Potter and The Goblet of Fire",
        "genre": "Adventure, Family, Fantasy",
        "rating": "7.7",
      },
      {
        "image": "images/orderofphoenix.jpg",
        "title": "Harry Potter and The Order of Phoenix",
        "genre": "Action, Adventure, Family",
        "rating": "7.5",
      }
    ],
  };
  MovieList movie1;
  MovieList movie2;
  MovieList movie3;
  MovieList movie4;
  List<MovieList> movieList = [];
  @override
  void initState() {
    super.initState();
    String jsonData = json.encode(map);
    String jsonData2 = json.encode(map2);
    String jsonData3 = json.encode(map3);
    String jsonData4 = json.encode(map4);
    movie1 = movieListFromJson(jsonData);
    movie2 = movieListFromJson(jsonData2);
    movie3 = movieListFromJson(jsonData3);
    movie4 = movieListFromJson(jsonData4);
    movieList.add(movie1);
    movieList.add(movie2);
    movieList.add(movie3);
    movieList.add(movie4);
  }

  @override
  Widget build(BuildContext context) {
    Sizes().init(context);
    return Scaffold(
      backgroundColor: ColorUtils.appBackgroundColor,
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, movieIndex) {
            return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 4),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MovieTile(
                    asset: movieList[movieIndex].movieList[index].poster,
                    movieTitle: movieList[movieIndex].movieList[index].title,
                    movieGenre: movieList[movieIndex].movieList[index].genre,
                    ratingNumber: movieList[movieIndex].movieList[index].rating,
                  );
                },
                itemCount: movieList[movieIndex].movieList.length,
                separatorBuilder: (BuildContext context, index) {
                  return SizedBox(
                    width: 16,
                  );
                },
              ),
              height: Sizes.movieTileHeight,
            );
          },
          separatorBuilder: (BuildContext context, index) {
            return SizedBox(
              height: 16,
            );
          },
          itemCount: movieList.length),
    );
  }
}
