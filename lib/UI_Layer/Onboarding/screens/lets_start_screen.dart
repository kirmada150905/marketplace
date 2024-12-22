import 'package:flutter/material.dart';
import 'package:marketplace/UI_Layer/Styles/button_styles.dart';
import 'package:marketplace/UI_Layer/Styles/text_styles.dart';

class LetsStartScreen extends StatefulWidget {
  const LetsStartScreen({super.key});

  @override
  State<LetsStartScreen> createState() => _LetsStartScreenState();
}

class _LetsStartScreenState extends State<LetsStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "./assets/lets_start_page_image.png",
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              Text(
                "Welcome to the club of Shoesly",
                style: (Theme.of(context).textTheme.displayLarge),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 60))
                          .copyWith(
                              backgroundColor:
                                  const WidgetStatePropertyAll(Colors.black)),
                      child: Text(
                        "LET'S SEARCH SHOES!",
                        style: whiteText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
