import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/UI_Layer/Styles/styles.dart';
import 'package:marketplace/UI_Layer/Styles/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  IconData _checkBoxIcon = Icons.circle_outlined;
  bool _checkBox = false;

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
              //removing this is casuing text to behave differently??
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account',
                    style: Theme.of(context).textTheme.displayLarge),
                const SizedBox(height: 20),
                Text("Please Sign up to your Shoesly Account",
                    style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          decoration: loginFields.copyWith(
                            hintText: "Prista Candra",
                          ),
                        ),
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
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Confirm Password",
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
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _checkBox = !_checkBox;
                      if (_checkBox)
                        _checkBoxIcon = Icons.check_circle;
                      else
                        _checkBoxIcon = Icons.circle_outlined;
                    });
                  },
                  icon: Icon(_checkBoxIcon),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    text: "By signing up you agree to the",
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    children: [
                      TextSpan(
                        text: " Terms of Service\n",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          print("Trying to sign in");
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passController.text,
                            );
                            context.go('/lets_start');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 60))
                            .copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.black)),
                        child: Text(
                          "Sign Up",
                          style: whiteText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 60))
                            .copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.white)),
                        child: Text(
                          "FACEBOOK",
                          style: blackText,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have Account?"),
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text(
                          "Sign In Now",
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
