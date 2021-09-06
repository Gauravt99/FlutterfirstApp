import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingTabBarPageView extends StatefulWidget {
  @override
  _FloatingTabBarPageViewState createState() => _FloatingTabBarPageViewState();
}

class _FloatingTabBarPageViewState extends State<FloatingTabBarPageView> {
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(76);
  int _selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  Widget floatingActionButtonBar() {
    Widget floatingBottomBar(value) {
      return Container(
        height: 60 *
            (MediaQuery.of(context).size.height - value) /
            (MediaQuery.of(context).size.height - 50),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 35,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CupertinoTabBar(
                  border: Border(
                    bottom: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    top: BorderSide.none,
                  ),
                  currentIndex: _selectedIndex,
                  iconSize: 35,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded, size: 32)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.gamepad_rounded, size: 32)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.ac_unit_rounded, size: 32)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.nights_stay_rounded, size: 32)),
                  ],
                  onTap: (index) {
                    _onItemTapped(index);
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: playerExpandProgress,
      builder: (BuildContext context, double value, _) {
        return floatingBottomBar(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (indx) => setState(() => _selectedIndex = indx),
                controller: pageController,
                children: [
                  /* Put your Pages here */
                  Center(child: Text("Tab 1")),
                  Center(child: Text("Tab 2")),
                  Center(child: Text("Tab 3")),
                  Center(child: Text("Tab 4")),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButtonBar(),
    );
  }
}
