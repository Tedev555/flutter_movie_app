import 'package:flutter/material.dart';
import 'package:flutter_movies_app/components/movie_cell.dart';
import 'package:flutter_movies_app/pages/movies_list/movies_list_view_model.dart';
import 'package:flutter_movies_app/providers/app_state.dart';
import 'package:provider/provider.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Access user from AppState
    final user = context.read<AppState>().user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          // color: mainColor,
        ),
        title: const Text(
          'Movies',
          style: TextStyle(
              // color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        actions: const <Widget>[
          Icon(
            Icons.menu,
            // color: mainColor,
          )
        ],
      ),
      body: Consumer<MoviesListViewModel>(
        builder: (contex, model, _) {
          if (model.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (model.error != null) {
            return Center(child: Text('Error: ${model.error}'));
          }
          if (model.movieList.isEmpty) {
            return const Center(child: Text('No Data'));
          }

          final movies = model.movieList;
          return _buildMovieList(movies);
        },
      ),
    );
  }

  _buildMovieList(movies) {
    return FloatingActionButton(
      onPressed: () => context.read<ExampleState>().increment(),
      child: Icon(Icons.plus_one),
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    child: MovieCell(movies, i),
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
