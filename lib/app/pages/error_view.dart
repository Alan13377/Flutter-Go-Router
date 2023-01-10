import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_deep_links/app/router/routes.dart';

class ErrorView extends StatelessWidget {
  final GoRouterState goRouterState;
  const ErrorView({super.key, required this.goRouterState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${goRouterState.error} Error 404 Pagina No Encontrada!!",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed(Routes.home);
              },
              child: const Text("Regresar al Inicio"),
            )
          ],
        ),
      ),
    );
  }
}
