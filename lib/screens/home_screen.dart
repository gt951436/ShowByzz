import 'package:flutter/material.dart';
import 'package:showbyzz/common/utils.dart';
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
  Apiservices apiServices = Apiservices();

  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          height: 58,
          width: 122,
        ),
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
          SizedBox(
            height: 215,
            child: MovieCard(
                future: upcomingFuture, headlineText: "Upcoming Movies"),
          )
        ],
      )),
    );
  }
}
