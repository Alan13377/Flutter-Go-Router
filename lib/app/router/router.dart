import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final _router = GoRouter(
    initialLocation: "/",
    errorBuilder: ((context, state) {
      return ErrorView(goRouterState: state);
    }),
    routes: [
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
          path: "/signIn",
          builder: (context, state) {
            return const SignInView();
          }),
    ],
  );

  GoRouter get router => _router;
}
