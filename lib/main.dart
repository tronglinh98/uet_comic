import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:uet_comic/src/pages/account.dart';
import 'package:uet_comic/src/pages/home.dart';
import 'package:uet_comic/src/pages/search.dart';
import 'package:uet_comic/src/pages/settings.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UET comic',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // bool _showAppbar = true; //this is to show app bar
  // ScrollController _scrollBottomBarController = ScrollController(); // set controller on scrolling
  // bool isScrollingDown = false;
  // bool _show = true;

  // void showBottomBar() {
  //   setState(() {
  //     _show = true;
  //   });
  // }

  // void hideBottomBar() {
  //   setState(() {
  //     _show = false;
  //   });
  // }

  // void _onTap(int index) {
  //   pageController.jumpToPage(index);
  //   // _scaffoldKey.currentState.openDrawer();
  // }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pageController = PageController();
  final bodyList = <Widget>[
    HomePage(),
    SearchPage(),
    AccountPage(),
    SettingsPage(),
  ];

  final items = <BottomNavyBarItem>[
    BottomNavyBarItem(
      icon: Icon(Icons.apps),
      title: Text('Home'),
      activeColor: Colors.red,
    ),
    BottomNavyBarItem(
        icon: Icon(Icons.people),
        title: Text('Users'),
        activeColor: Colors.purpleAccent),
    BottomNavyBarItem(
        icon: Icon(Icons.message),
        title: Text('Messages'),
        activeColor: Colors.pink),
    BottomNavyBarItem(
        icon: Icon(Icons.settings),
        title: Text('Settings'),
        activeColor: Colors.blue),
  ];

  // void scrollToHide() async {
  //   _scrollBottomBarController.addListener(() {
  //     if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.reverse && !isScrollingDown) {
  //       isScrollingDown = true;
  //       _showAppbar = false;
  //       hideBottomBar();
  //     }
  //     if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.forward && isScrollingDown) {
  //       isScrollingDown = false;
  //       _showAppbar = true;
  //       showBottomBar();
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // scrollToHide();
  }

  // @override
  // void dispose() {
  //   _scrollBottomBarController.removeListener(() {});
  //   super.dispose();
  // }

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: bodyList,
          physics: ClampingScrollPhysics(),
          // physics: NeverScrollableScrollPhysics (), // No sliding
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
                  _selectedIndex = index;
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }),
            items: items));
  }
}
