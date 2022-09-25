import 'package:flutter/material.dart';
import 'package:flutter_movies_app/app.dart';
import 'package:flutter_movies_app/providers/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppState>(
      /// Initilize AppState to store global states
      create: (_) => AppState(),
    )
  ], child: const App()));
}
