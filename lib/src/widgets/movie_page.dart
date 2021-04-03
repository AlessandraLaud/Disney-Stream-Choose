import 'package:flutter/material.dart';
import 'package:stream_choose/src/providers/disney_plus_provider.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    const imageBaseUrl = "https://image.tmdb.org/t/p/w500";

    return Consumer<DisneyPlusProvider>(
        builder: (BuildContext context, DisneyPlusProvider provider, Widget _) {
      return Column(
        children: [
          Center(
            child: Container(
                alignment: Alignment.center,
                height: 400,
                child: provider.isMovieSet
                    ? Image.network(imageBaseUrl + provider.movie.image)
                    : Image.asset('assets/disney.png')),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              child: Text(provider.isMovieSet ? provider.movie.title : "",
                  style: theme.textTheme.headline2),
            ),
          ),
        ],
      );
    });
  }
}
