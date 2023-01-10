import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorView extends StatelessWidget {
  final MaterialColor color;
  final String colorName;
  final bool showAppBar;
  const ColorView(
      {super.key,
      required this.color,
      required this.colorName,
      this.showAppBar = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showAppBar)
          AppBar(
            backgroundColor: color,
            title: Text(colorName),
          ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 9,
            itemBuilder: (context, index) {
              final shade = 100 * index + 100;
              final variant = color[shade];
              print(variant);
              return InkWell(
                onTap: () {
                  final router = GoRouter.of(context);
                  final location =
                      router.namedLocation(colorName.toLowerCase());
                  router.push("$location/details/$shade");
                },
                child: Container(
                  height: 100,
                  color: variant,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
