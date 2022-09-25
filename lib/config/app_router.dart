import 'package:flutter/material.dart';
import 'package:flutter_movies_app/pages/movies_list/movies_list.dart';
import 'package:flutter_movies_app/pages/movies_list/movies_list_view_model.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static const String initial = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<MoviesListViewModel>(

                /// Initialize ViewModel object and fetching data
                create: (_) => MoviesListViewModel(),

                /// View
                child: const MoviesListPage()));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('ບໍ່ມີຫນ້າທີ່ທ່ານຕ້ອງການ'),
                  ),
                ));
    }
  }
}
