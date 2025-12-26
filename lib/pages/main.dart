import 'package:e_com/pages/cart.dart';
import 'package:e_com/pages/favorite.dart';
import 'package:e_com/pages/main2.dart';
import 'package:flutter/material.dart';
import 'package:e_com/pages/home.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  void changetab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<String> _routes = [
    '/home',
    '/cart',
    '/bag',
    '/favorite',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (_) => _getPage(_routes[_currentIndex]),
            );
          },
        ),

        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 40),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined, size: 40),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 40),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined, size: 40),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPage(String route) {
    switch (route) {
      case '/home':
        return home(
          onViewAll: () => changetab(2), // 👈 switch to Bag tab
        );

      case '/bag':
        return const main2();

      case '/cart':
        return cart();

      case '/favorite':
        return Favorite();

      default:
        return home(
          onViewAll: () => changetab(2),
        );
    }
  }
}
