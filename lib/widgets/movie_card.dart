import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:showbyzz/common/utils.dart';
import 'package:showbyzz/models/upcoming_movies_model.dart';
import 'package:showbyzz/screens/movie_detailed_screen.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headlineText;
  const MovieCard(
      {super.key, required this.future, required this.headlineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          var data = snapshot.data?.results;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headlineText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: data!.length, // not null length
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                movieId: data[index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                              "$imageUrl${data?[index].posterPath}"),
                        ),
                      ));
                },
              ))
            ],
          );
        });
  }
}
