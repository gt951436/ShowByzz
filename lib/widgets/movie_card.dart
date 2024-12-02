import 'package:flutter/material.dart';
import 'package:showbyzz/common/utils.dart';
import 'package:showbyzz/models/upcoming_movies_model.dart';

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
                padding: const EdgeInsets.all(11),
                itemCount: data?.length, // not null length
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Image.network("$imageUrl${data?[index].posterPath}"),
                  );
                },
              ))
            ],
          );
        });
  }
}
