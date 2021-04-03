import 'package:flutter/material.dart';
import 'package:stream_choose/src/providers/disney_plus_provider.dart';
import 'package:provider/provider.dart';
import 'package:stream_choose/src/widgets/movie_page.dart';

class HomePage extends StatelessWidget {
  final title;

  HomePage({@required this.title});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Consumer<DisneyPlusProvider>(
        builder: (BuildContext context, DisneyPlusProvider provider, Widget _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [
                  Colors.deepPurple[200],
                  Colors.deepPurple[200],
                  Colors.deepPurple[300],
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("What should I watch on Disney+ ?",
                    style: theme.textTheme.headline1),
                SizedBox(
                  height: 40,
                ),
                provider.isLoading ? CircularProgressIndicator() : MoviePage(),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                      padding: EdgeInsets.all(15),
                      textColor: Colors.white,
                      child: Text("Choose!!"),
                      onPressed: () async {
                        provider.setMovie();
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
