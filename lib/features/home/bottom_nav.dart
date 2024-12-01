import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend/features/home/connect/presentation/page/connect_screen.dart';
import 'package:spend/features/home/earn/presentation/page/earn_screen.dart';
import 'package:spend/features/home/portfolio/presentation/page/portfolio_screen.dart';
import 'package:spend/features/home/spend/presentation/page/spend_screen.dart';

import 'home_page/presentation/page/home_screen.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {



  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget> [

        const HomeScreen(),
        const PortfolioScreen(),
        const EarnScreen(),
        const SpendScreen(),
        const ConnectScreen(),


      ].elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
        unselectedItemColor:Colors.grey ,
        currentIndex: currentIndex,
        onTap: (index) {
          print(index);

          setState(() => {currentIndex = index});
        },
        iconSize: 20,
        items: [
           BottomNavigationBarItem(label: "Explore", icon: SvgPicture.asset(
            "assets/images/compass.svg",
            height: 20,
            width: 20,
            color: currentIndex == 0 ? Colors.black : Colors.black54,
          ),),
          BottomNavigationBarItem(
            label: "Portfolio",
            icon: SvgPicture.asset(
              "assets/images/wallet.svg",
              height: 20,
              width: 20,
              color: currentIndex == 1 ? Colors.black :  Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            label: "Earn",
            icon: SvgPicture.asset(
              "assets/images/percentage.svg",
              height: 20,
              width: 20,
              color: currentIndex == 2 ? Colors.black :  Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
            label: "Spend",
            icon: SvgPicture.asset(
              "assets/images/spend.svg",
              height: 20,
              width: 20,
              color: currentIndex == 3 ? Colors.black :  Colors.black54,
            ),
          ),
          BottomNavigationBarItem(
              label: "Connect", icon: SvgPicture.asset(
            "assets/images/connect.svg",
            height: 20,
            width: 20,
            color: currentIndex == 4 ? Colors.black :  Colors.black54,
          ),),
        ],
      ),
    );
  }

}