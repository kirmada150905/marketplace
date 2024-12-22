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
                        Text(
                          "Name",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: loginFields.copyWith(
                            hintText: "Prista Candra",
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
                        Text(
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
                        Text(
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
                IconButton(onPressed: () {}, icon: Icon(Icons.circle_outlined)),
                Text(
                  "By Signing up you agree to the\n Terms of Service and Privacy Policy",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/log_in');
                        },
                        style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 60))
                            .copyWith(
                                backgroundColor:
                                    const WidgetStatePropertyAll(Colors.black)),
                        child: Text(
                          "GET STARTED",
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
                    const Text("Join with us"),
                    TextButton(
                        onPressed: () {}, child: const Text("Create Account"))
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
