import 'package:flutter/material.dart';
import 'package:showbyzz/screens/home_screen.dart';
import 'package:showbyzz/screens/new_hot_screen.dart';
import 'package:showbyzz/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            indicatorColor: Colors.deepOrange,
            dividerHeight: BorderSide.strokeAlignCenter,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Color(0xff999999),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
                text: "Home",
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
                text: "Seacrh",
              ),
              Tab(
                icon: Icon(
                  Icons.local_fire_department,
                ),
                text: "New & Hot",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          HomeScreen(),
          SearchScreen(),
          NewAndHotScreen(),
        ]),
      ),
    );
  }
}
