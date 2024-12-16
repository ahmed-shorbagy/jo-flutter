import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jo_univ_flutter/core/utils/App_router.dart';
import 'package:jo_univ_flutter/core/utils/notifications_service.dart';
import 'package:jo_univ_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initializeNotification();

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
