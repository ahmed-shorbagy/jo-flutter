import 'package:flutter/material.dart';
import 'package:jo_univ_flutter/core/utils/App_router.dart';

void main() {
  runApp(const UnivversityApp());
}

class UnivversityApp extends StatelessWidget {
  const UnivversityApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
