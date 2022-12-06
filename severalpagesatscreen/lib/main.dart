import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    Provider.value(value: StreamBackStackSupport()),
    StreamProvider<homePages>(
      create: (context) =>
      Provider.of<StreamBackStackSupport>(context, listen: false)
          .selectedPage,
    )
  ], child: StartupApplication()));
}

class StartupApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackStack Support App',
      home: MainBodyApp(),
    );
  }
}

class MainBodyApp extends HookWidget {
  final List<Widget> _fragments = [
    DashboardPage(),
    UserProfilePage(),
    SearchPage()
  ];
  List<int> _backStack = [0];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackStack Screen'),
      ),
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          customPop(context);
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Consumer<homePages>(
                builder: (context, selectedPage, child) {
                  _currentIndex = selectedPage != null ? selectedPage.index : 0;
                  _backStack.add(_currentIndex);
                  return Expanded(child: _fragments[_currentIndex]);
                },
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                color: Colors.indigo[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => Provider.of<StreamBackStackSupport>(
                          context,
                          listen: false)
                          .switchBetweenPages(homePages.screenDashboard),
                      child: Text('Dashboard'),
                    ),
                    RaisedButton(
                      onPressed: () => Provider.of<StreamBackStackSupport>(
                          context,
                          listen: false)
                          .switchBetweenPages(homePages.screenProfile),
                      child: Text('Profile'),
                    ),
                    RaisedButton(
                      onPressed: () => Provider.of<StreamBackStackSupport>(
                          context,
                          listen: false)
                          .switchBetweenPages(homePages.screenSearch),
                      child: Text('Search'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateBack(int index) {
    useState(() => _currentIndex = index);
  }

  void customPop(BuildContext context) {
    if (_backStack.length - 1 > 0) {
      navigateBack(_backStack[_backStack.length - 1]);
    } else {
      _backStack.removeAt(_backStack.length - 1);
      Provider.of<StreamBackStackSupport>(context, listen: false)
          .switchBetweenPages(homePages.values[_backStack.length - 1]);
      Navigator.pop(context);
    }
  }
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenProfile ...'),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenDashboard ...'),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(' screenSearch ...'),
    );
  }
}

enum homePages { screenDashboard, screenProfile, screenSearch }

class StreamBackStackSupport {
  final StreamController<homePages> _homePages = StreamController<homePages>();

  Stream<homePages> get selectedPage => _homePages.stream;

  void switchBetweenPages(homePages selectedPage) {
    _homePages.add(homePages.values[selectedPage.index]);
  }

  void close() {
    _homePages.close();
  }
}