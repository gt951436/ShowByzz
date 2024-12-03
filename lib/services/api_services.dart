import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:showbyzz/common/utils.dart';
import 'package:showbyzz/models/movie_detail.dart';
import 'package:showbyzz/models/movie_recommendation.dart';
import 'package:showbyzz/models/tv_series_model.dart';
import 'package:showbyzz/models/upcoming_movies_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
late String endPoint;
var key = '?api_key=$apiKey';

class Apiservices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final destinationUrl = "$baseUrl$endPoint?api_key=$apiKey";

    final response = await http.get(Uri.parse(destinationUrl));

    if (response.statusCode == 200) {
      log("Success : ${response.body}");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies!");
  }

  Future<UpcomingMovieModel> getNowPlayingMovies() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<MovieRecommendationsModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/1396/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated series');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
}
