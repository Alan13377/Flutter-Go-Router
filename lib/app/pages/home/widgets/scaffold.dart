import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_deep_links/app/router/routes.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key, required this.child});
  final Widget child;

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    //*Verificar que el widget se renderee por lo menos una vez
    WidgetsBinding.instance.addPostFrameCallback((
      _,
    ) {
      counter.value++;
    });
  }

  @override
  void didUpdateWidget(covariant HomeScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((
      _,
    ) {
      counter.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Navigator.canPop(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<int>(
          valueListenable: counter,
          builder: (context, value, child) {
            return AppBar(
              //*Permite regresar a la pagina anterior
              leading: value > 0 && GoRouter.of(context).canPop()
                  ? BackButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    )
                  : null,
              actions: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(Routes.profile);
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            );
          },
        ),
      ),
      body: widget.child,
    );
  }
}
