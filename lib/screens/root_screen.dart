import 'package:flutter/material.dart';

import '../services/app_state.dart';
import 'favorites_screen.dart';
import 'history_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key, required this.state});

  final AppState state;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(state: widget.state),
      SearchScreen(state: widget.state),
      FavoritesScreen(state: widget.state),
      HistoryScreen(state: widget.state),
    ];
    return Scaffold(
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: _index,
            onTap: (i) => setState(() => _index = i),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search_rounded),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline_rounded),
                activeIcon: Icon(Icons.bookmark_rounded),
                label: 'Избранное',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                activeIcon: Icon(Icons.history_rounded),
                label: 'История',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
