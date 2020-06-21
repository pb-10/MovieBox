import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

class MovieList {
  List<Movie> movieList;

  MovieList({
    this.movieList,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      MovieList(
        movieList: List<Movie>.from(
            json["moviesLists"].map((x) => Movie.fromJson(x))),
      );
}
class Movie {
  String poster;
  String title;
  String genre;
  String rating;

  Movie({
    this.poster,
    this.title,
    this.genre,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    poster: json["image"],
    title: json["title"],
    genre: json["genre"],
    rating: json["rating"],
  );
}
