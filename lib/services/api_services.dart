import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:showbyzz/common/utils.dart';
import 'package:showbyzz/models/upcoming_movies_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
late String endPoint;

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
}
