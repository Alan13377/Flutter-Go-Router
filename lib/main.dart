import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_deep_links/app/global/session_provider.dart';
import 'package:navigator_deep_links/app/pages/splash_view.dart';
import 'package:navigator_deep_links/app/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //*Quitar numeral del enlace
  setPathUrlStrategy();
  final preferences = await SharedPreferences.getInstance();
  SessionProvider(preferences);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: loading
          ? const SplashView()
          : MaterialApp.router(
              debugShowCheckedModeBanner: false,
              //*Rutas
              routerConfig: router,
            ),
    );
  }
}





//  Navigator(
//         onPopPage: (route, result) {
//           if (route.didPop(result)) {
//             productId = null;
//             print(productId);
//             return true;
//           }
//           return false;
//         },
//         pages: [
//           const MaterialPage(
//             child: HomeView(),
//           ),
//           if (productId != null)
//             MaterialPage(
//               child: ProductView(id: productId!),
//             ),
//         ],
//       ),
