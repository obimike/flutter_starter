import 'package:flutter/material.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/constants/strings.dart';
import 'package:flutter_starter/feature/passenger/home/ui/home.dart';
import 'package:flutter_starter/feature/passenger/settings/ui/settings.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  final List<Widget> _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const SettingsPage(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        unselectedItemColor: MyColors.secondaryTextColorLight,
        unselectedIconTheme: const IconThemeData(
            size: 24
        ),
        selectedItemColor: MyColors.primary,
        iconSize: 24,
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },



        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: MyStrings.navHome),
          BottomNavigationBarItem(icon: Icon(Iconsax.search_favorite), label: MyStrings.navSearch),
          BottomNavigationBarItem(icon: Badge(label: Text('2'),child: Icon(Iconsax.message)), label: MyStrings.navChats),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: MyStrings.navAccount),
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}
