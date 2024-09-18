import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/home_screen.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/helpers/navigation_service.dart';
import 'package:yash_sherpura_budventure_task/presentation/search_screen/search_screen.dart';
import 'package:yash_sherpura_budventure_task/presentation/themes/palette.dart';
import 'package:yash_sherpura_budventure_task/presentation/widgets/app_scaffold.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State {
  int _selectedTab = 0;

  final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: WillPopScope(
        onWillPop: () async {
          await Utility.showDialogCustom(
            context: NavigationService.navigatorKey.currentContext!,
            title: StringConstants.labelExit,
            content: StringConstants.msgExit,
            positiveButtonText: StringConstants.labelYes,
            negativeButtonText: StringConstants.labelNo,
            barrierDismissible: true,
          ).then((int? value) async {
            if (value == 0) {
              exit(0);
            }
          });
          return false;
        },
        child: _pages[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (int index) => changeTab(index),
        selectedItemColor: Palette.secondaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: StringConstants.labelMovies,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: StringConstants.labelSearch,
          ),
        ],
      ),
    );
  }
}
