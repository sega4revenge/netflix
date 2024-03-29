import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Application/main.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/CustomView/Tabbar/BottomTabBar.dart';
import 'package:netflix/Network/Service/MovieCategory/MovieRepo.dart';
import 'package:netflix/Screen/Home/HomeBloc.dart';
import 'package:netflix/Screen/Home/HomeScreen.dart';
import 'package:provider/provider.dart';
class RootTabbar extends StatefulWidget {
  RootTabbar({Key? key}) : super(key: key);

  @override
  _RootTabbarState createState() => _RootTabbarState();
}

class _RootTabbarState extends State<RootTabbar> {
  List<Widget> listScreens = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    MovieRepo movieRepo = MovieRepo();
    listScreens = [
      MultiProvider(
        providers: [
          Provider<HomeBloc>(
              create: (_) => HomeBloc(movieRepo),
              dispose: (_, bloc) => bloc.dispose()),
        ],
        child: HomeScreen(),
      ),
      MultiProvider(
        providers: [
          Provider<HomeBloc>(
              create: (_) => HomeBloc(movieRepo),
              dispose: (_, bloc) => bloc.dispose()),
        ],
        child: Container(),
      ),
      MultiProvider(
        providers: [
          Provider<HomeBloc>(
              create: (_) => HomeBloc(movieRepo),
              dispose: (_, bloc) => bloc.dispose()),
        ],
        child: Container(),
      ),
      MultiProvider(
        providers: [
          Provider<HomeBloc>(
              create: (_) => HomeBloc(movieRepo),
              dispose: (_, bloc) => bloc.dispose()),
        ],
        child: Container(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
          length: listScreens.length,
          child: Scaffold(
            body: IndexedStack(index: _currentIndex, children: listScreens),
            bottomNavigationBar: BottomTabBar(
              selectedIndex: _currentIndex,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: (index) =>
                  setState(() {
                    _currentIndex = index;
                  }),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  activeColor: ColorConstant.MAIN_COLOR,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Category'),
                  activeColor: ColorConstant.MAIN_COLOR,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text(
                    'Favorite',
                  ),
                  activeColor: ColorConstant.MAIN_COLOR,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: ColorConstant.MAIN_COLOR,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
      ),
    );
  }
}
