import 'package:go_router/go_router.dart';
import 'package:marketplace/UI_Layer/Onboarding/screens/get_started.dart';
import 'package:marketplace/UI_Layer/Onboarding/screens/logIn_screen.dart';
import 'package:marketplace/UI_Layer/Onboarding/screens/signUp_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const GetStarted();
      },
      routes: [
        GoRoute(
          path: 'log_in',
          builder: (context, state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: 'sign_up',
          builder: (context, state) {
            return SignUpScreen();
          },
        ),
      ]),
]);
