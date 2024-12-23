import 'package:flutter/material.dart';
import 'package:marketplace/UI_Layer/Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.black,
            surface: Colors.white),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}