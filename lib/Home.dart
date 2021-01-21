import 'package:fix_app/Account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:io' show Platform;
import 'package:fix_app/LogIn.dart';
import 'package:fix_app/Shop.dart';
import 'package:fix_app/Category.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IOSFixTabBar();
    } else {
      return AndroidFixTabBar();
    }
  }
}

class AndroidFixTabBar extends StatefulWidget {
  @override
  _AndroidFixTabBarState createState() => _AndroidFixTabBarState();
}

class _AndroidFixTabBarState extends State<AndroidFixTabBar> {

  int index = 0;
  List<Widget> _screens = [Shop(), LogIn(), Account(), LogIn()];

  tapped(int tappedIndex) {
    setState(
          () {
        index = tappedIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffFF5722),
        currentIndex: index,
        onTap: tapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Porositë',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Llogaria',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(CupertinoIcons.bag_fill),
                Positioned(
                  right: 0,
                  top: 2,
                  child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),
              ],
            ),
            label: 'Shporta',
          ),
        ],
      ),
    );
  }
}


class IOSFixTabBar extends StatefulWidget {
  @override
  _IOSFixTabBarState createState() => _IOSFixTabBarState();
}

class _IOSFixTabBarState extends State<IOSFixTabBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: CupertinoColors.systemYellow,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2_fill),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tray_full_fill),
              label: 'Porositë',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              label: 'Llogaria',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  Icon(CupertinoIcons.bag_fill),
                  Positioned(
                    right: 0,
                    top: 2,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              label: 'Shporta',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          assert(index >= 0 && index <= 3);
          switch (index) {
            case 0:
              return Shop();
              break;
            case 1:
              return LogIn();
              break;
            case 2:
              return Account();
              break;
            case 3:
              return LogIn();
              break;
          }
          return null;
        },
      ),
    );
  }
}


