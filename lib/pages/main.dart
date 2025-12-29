import 'package:e_com/pages/cart.dart';
import 'package:e_com/pages/favorite.dart';
import 'package:e_com/pages/main2.dart';
import 'package:e_com/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_com/pages/home.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell>
    with WidgetsBindingObserver {

  int _currentIndex = 0;
  DateTime? _lastBackPress;

  void changetab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Prevent black screen when app is resumed
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() => _currentIndex = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // we fully control back behavior
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // 🔹 If not on Home → go Home
        if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
          return;
        }

        // 🔹 Double back to exit
        final now = DateTime.now();
        if (_lastBackPress == null ||
            now.difference(_lastBackPress!) > const Duration(seconds: 2)) {
          _lastBackPress = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        // 🔹 Exit app
        Navigator.of(context).maybePop();
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            home(onViewAll: () => changetab(2)),
            const cart(),
            const main2(),
            const Favorite(),
            const profile(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 100,

          child: BottomNavigationBar(
            elevation: 4,
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
}
