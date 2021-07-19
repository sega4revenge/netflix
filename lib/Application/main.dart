import 'package:flutter/material.dart';
import 'package:netflix/CustomView/Tabbar/BottomTabBar.dart';
import 'package:netflix/Network/Service/MovieCategory/MovieRepo.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieBloc.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieRoute.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieScreen.dart';
import 'package:netflix/Screen/Home/HomeBloc.dart';
import 'package:netflix/Screen/Home/HomeRoute.dart';
import 'package:netflix/Screen/Tabbar/RootTabbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeRoute.routeId,
      onGenerateRoute: (RouteSettings settings) {
        print("au ze");
        switch (settings.name) {
          case HomeRoute.routeId:
            return MaterialPageRoute(
              builder: (context) {
                return RootTabbar();
              }
            );
          case DetailMovieRoute.routeId:
            var arguments = settings.arguments as DetailMovieRoute;
            return MaterialPageRoute(
              builder: (context) {
                return MultiProvider(
                  providers: [
                    Provider<DetailMovieBloc>(
                        create: (_) => DetailMovieBloc(arguments.movieId ?? -999),
                        dispose: (_, bloc) => bloc.dispose()),
                  ],
                  child: DetailMovieScreen(),
                );
              },
            );
        }
      },
    );
  }
}
