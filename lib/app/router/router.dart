import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_deep_links/app/pages/colors/color_details.dart';
import 'package:navigator_deep_links/app/pages/colors/color_view.dart';
import 'package:navigator_deep_links/app/pages/colors/widgets/colors_scaffold.dart';
import 'package:navigator_deep_links/app/pages/error_view.dart';
import 'package:navigator_deep_links/app/pages/home/home_view.dart';
import 'package:navigator_deep_links/app/pages/home/product_view.dart';
import 'package:navigator_deep_links/app/pages/home/widgets/scaffold.dart';
import 'package:navigator_deep_links/app/pages/profile_view.dart';
import 'package:navigator_deep_links/app/pages/sign_in_view.dart';
import 'package:navigator_deep_links/app/router/routes.dart';
import 'package:navigator_deep_links/main.dart';

//**Definimos Rutas con GoRouter */
mixin RouterMixin on State<MyApp> {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  GoRouter? _router;

  GoRouter get router {
    if (_router != null) {
      return _router!;
    }
    _router = GoRouter(
      initialLocation: "/red",
      navigatorKey: rootNavigatorKey,
      errorBuilder: ((context, state) {
        return ErrorView(goRouterState: state);
      }),
      routes: [
        ShellRoute(
            builder: (context, state, child) {
              return ColorsScafold(child: child);
            },
            routes: [
              GoRoute(
                name: Routes.red,
                path: "/red",
                builder: (context, state) {
                  return const ColorView(
                    color: Colors.red,
                    colorName: "RED",
                  );
                },
                routes: [
                  ColorDetail.getRoute(Colors.red),
                ],
              ),
              GoRoute(
                name: Routes.green,
                path: "/green",
                builder: (context, state) {
                  return const ColorView(
                    color: Colors.green,
                    colorName: "GREEN",
                  );
                },
                routes: [
                  ColorDetail.getRoute(Colors.green),
                ],
              ),
              GoRoute(
                name: Routes.blue,
                path: "/blue",
                builder: (context, state) {
                  return const ColorView(
                    color: Colors.blue,
                    colorName: "BLUE",
                  );
                },
                routes: [
                  ColorDetail.getRoute(Colors.blue),
                ],
              ),
            ]),
        ShellRoute(
            builder: (context, state, child) {
              return HomeScaffold(child: child);
            },
            routes: [
              GoRoute(
                  name: Routes.home,
                  path: "/",
                  builder: (context, state) {
                    return const HomeView();
                  }),
              GoRoute(
                  name: Routes.product,
                  path: "/product/:id",
                  builder: (_, state) {
                    print(state.params["id"]);
                    final id = state.params["id"];
                    return ProductView(id: int.parse(id!));
                  }),
            ]),
        GoRoute(
            name: Routes.profile,
            parentNavigatorKey: rootNavigatorKey,
            path: "/profile",
            builder: (context, state) {
              return const ProfileView();
            },
            redirect: (context, state) async {
              const isSignedIn = false;
              // if (isSignedIn) {
              //
              //   return null;
              // }

              return "/signIn";
            }),
        GoRoute(
            name: Routes.signIn,
            parentNavigatorKey: rootNavigatorKey,
            path: "/signIn",
            builder: (context, state) {
              return const SignInView();
            }),
      ],
    );
    return _router!;
  }
}
