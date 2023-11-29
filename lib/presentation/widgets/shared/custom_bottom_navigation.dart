import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  void onItemTapped(BuildContext context, int index){
    switch(index){
      case 0:
        context.go('/');
      case 1: 
        context.go('/');
      case 2:
        context.go('/favorites');
    }
  }

  int getCurrentIndex(BuildContext context){
    
    final String location = GoRouterState.of(context).uri.toString();

    switch(location){
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {



    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (value){
        onItemTapped(context, value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined), 
          label: 'Categorias'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline_outlined), 
          label: 'Favoritos'
        ),
      ],
    );
  }
}
