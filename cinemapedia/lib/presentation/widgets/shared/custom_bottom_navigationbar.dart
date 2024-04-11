import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  final int currentIndex;

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home_max)),
        BottomNavigationBarItem(
            label: 'Categorías', icon: Icon(Icons.label_outline)),
        BottomNavigationBarItem(
            label: 'Favoritos', icon: Icon(Icons.favorite_outline)),
      ],
    );
  }
}
