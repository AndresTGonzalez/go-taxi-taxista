import 'package:app_distribuidas_taxi/screens/logout.dart';
import 'package:app_distribuidas_taxi/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: Scaffold(
        bottomNavigationBar: _Navigation(),
        body: _Paginas(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigation.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ViajesAsignados(),
        Estado(),
        Logout(),
      ],
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      currentIndex: navigation.paginaActual,
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff202020),
      onTap: (value) => navigation.paginaActual = value,
      fixedColor: Color(0xffFFF000),
      items: [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Estado',
          icon: Icon(Icons.work),
        ),
        BottomNavigationBarItem(
          label: 'Usuario',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
