import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_deep_links/app/pages/colors/color_view.dart';

class ColorDetail extends StatelessWidget {
  final MaterialColor materialColor;
  final int shade;

  const ColorDetail(
      {super.key, required this.materialColor, required this.shade});

  static GoRoute getRoute(MaterialColor materialColor) {
    return GoRoute(
        path: "details/:shade",
        builder: (context, state) {
          final shade = int.parse(state.params["shade"]!);
          return ColorDetail(
            materialColor: materialColor,
            shade: shade,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(GoRouter.of(context).location);
    return Column(
      children: [
        AppBar(
          backgroundColor: materialColor[shade],
        ),
        Expanded(
          child: Container(
            color: materialColor[shade],
          ),
        ),
        Expanded(
          child: ColorView(
              showAppBar: false,
              color: materialColor,
              colorName: uri.pathSegments.first),
        ),
      ],
    );
  }
}
