import 'package:flutter/material.dart';

import 'components/dashboard/Dashboard.dart';
import 'components/mytracks/MyTracks.dart';
import 'components/others/Others.dart';

import 'package:envirocar_flutter/pages/loginsignup/Login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    Dashboard(),
    MyTracks(),
    Others(),
  ];

  PageController pageController;

  void initState() {
    pageController = new PageController(initialPage: _selectedIndex);
    super.initState();
  }

  void _onBottomNavNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
    this.pageController.animateToPage(
          _selectedIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/img_envirocar_logo_white.png',
            fit: BoxFit.scaleDown,
            height: 3 * kToolbarHeight / 5,
          ),
        ),
        shadowColor: Colors.transparent,
        leading: Container(),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String _selection) {
              switch (_selection) {
                case "Login/Register":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return {"Login/Register"}.map((choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      // body: pages[_selectedIndex],
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "My Tracks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Others",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBottomNavNavigate,
      ),
    );
  }
}
