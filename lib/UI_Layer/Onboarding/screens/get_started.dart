import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/UI_Layer/Onboarding/helpers/get_started_slides_text.dart';
import 'package:marketplace/UI_Layer/Routes/routes.dart';
import 'package:marketplace/UI_Layer/Styles/button_styles.dart';
import 'package:marketplace/UI_Layer/Styles/text_styles.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final _pageController = PageController();
  int _currPage = 0;
  final _totalPages = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _autoPlay();
  }

  void _autoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currPage < _totalPages - 1) {
        _currPage++;
      } else {
        _currPage = 0;
      }

      _pageController.animateToPage(
        _currPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 500,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _totalPages,
                      onPageChanged: (i) {
                        setState(() {
                          _currPage = i;
                        });
                      },
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            SizedBox(
                                width: 300,
                                height: 300,
                                child: Image.asset(
                                    "./assets/carousel_image_$i.png")),
                            Text(
                              desc_text[i][0],
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              desc_text[i][1],
                              style: Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _totalPages,
                        (index) => Expanded(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: index == _currPage
                                  ? Colors.black
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ),
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
                          onPressed: () {
                            context.push('/log_in');
                          },
                          style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 60))
                              .copyWith(
                                  backgroundColor: const WidgetStatePropertyAll(
                                      Colors.black)),
                          child: Text(
                            "GET STARTED",
                            style: whiteText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {},
                  //         style: ElevatedButton.styleFrom(
                  //                 minimumSize: const Size(100, 60))
                  //             .copyWith(
                  //                 backgroundColor: const WidgetStatePropertyAll(
                  //                     Colors.white)),
                  //         child: Text(
                  //           "GOOGLE",
                  //           style: blackText,
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () {},
                  //         style: ElevatedButton.styleFrom(
                  //                 minimumSize: const Size(100, 60))
                  //             .copyWith(
                  //                 backgroundColor: const WidgetStatePropertyAll(
                  //                     Colors.white)),
                  //         child: Text(
                  //           "FACEBOOK",
                  //           style: blackText,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
