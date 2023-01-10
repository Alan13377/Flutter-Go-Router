import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class ColorsScafold extends StatefulWidget {
  const ColorsScafold({super.key, required this.child});
  final Widget child;

  @override
  State<ColorsScafold> createState() => _ColorsScafoldState();
}

class _ColorsScafoldState extends State<ColorsScafold> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = () {
      final location = GoRouter.of(context).location;
      if (location.startsWith("/red")) {
        return 0;
      }
      if (location.startsWith("/green")) {
        return 1;
      }
      return 2;
    }();
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          final router = GoRouter.of(context);
          if (index == selectedIndex && router.canPop()) {
            router.pop();
            return;
          }
          final routeName = () {
            if (index == 0) {
              return Routes.red;
            }
            if (index == 1) {
              return Routes.green;
            }
            return Routes.blue;
          }();
          router.goNamed(routeName);
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.reddit,
                color: Colors.red,
              ),
              label: "Red"),
          NavigationDestination(
              icon: Icon(
                Icons.reddit,
                color: Colors.green,
              ),
              label: "Green"),
          NavigationDestination(
              icon: Icon(
                Icons.reddit,
                color: Colors.blue,
              ),
              label: "Blue"),
        ],
      ),
    );
  }
}
