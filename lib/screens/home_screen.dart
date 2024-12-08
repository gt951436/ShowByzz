import 'package:flutter/material.dart';
import 'package:showbyzz/common/utils.dart';
import 'package:showbyzz/models/tv_series_model.dart';
import 'package:showbyzz/models/upcoming_movies_model.dart';
import 'package:showbyzz/services/api_services.dart';
import 'package:showbyzz/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlaying;
  late Future<TvSeriesModel> topRatedShows;
  Apiservices apiServices = Apiservices();

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    topRatedShows = apiServices.getTopRatedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        // title: Image.asset(
        //   "assets/logo.png",
        //   height: 58,
        //   width: 122,
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Container(
              color: const Color.fromARGB(255, 255, 225, 0),
              height: 28,
              width: 28,
            ),
          ),
          const SizedBox(
            width: 18,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          FutureBuilder<TvSeriesModel>(
            future: topRatedShows,
            builder: (context, snapshot) {
              return const SizedBox();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 215,
            child: MovieCard(future: nowPlaying, headlineText: "Now Playing.."),
          )
        ],
      )),
    );
  }
}
