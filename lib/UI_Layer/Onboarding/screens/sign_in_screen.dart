import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/UI_Layer/Styles/styles.dart';
import 'package:marketplace/UI_Layer/Styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      context.go('/lets_start');
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, bottom: 50, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign In',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20),
                Text("Please Sign In to your Shoesly Account",
                    style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _emailController,
                  decoration: loginFields.copyWith(
                    hintText: "pristia@gmail.com",
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _passController,
                  decoration: loginFields.copyWith(
                    hintText: "secret1234567",
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passController.text);
                            context.go('/lets_start');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 60))
                            .copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.black)),
                        child: Text(
                          "Sign In",
                          style: whiteText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _signInWithGoogle,
                        style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 60))
                            .copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.white)),
                        child: Text(
                          "GOOGLE",
                          style: blackText,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Join with us."),
                    TextButton(
                        onPressed: () {
                          context.push('/sign_up');
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
