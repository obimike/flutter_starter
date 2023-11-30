import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});



  @override
  Widget build(BuildContext context) {
    var dynamicWidth = MediaQuery.of(context).size.width;
    var dynamicHeight = MediaQuery.of(context).size.height;

    Color kDarkBlueColor = const Color(0xFF053149);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Image(image: AssetImage("assets/images/logo.png"), width: 160,),
            Expanded(
              child: OnBoardingSlider(
                finishButtonText: 'Get Started',
                onFinish: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => const RegisterPage(),
                  //   ),
                  // );
                },
                finishButtonStyle:  FinishButtonStyle(
                  backgroundColor: kDarkBlueColor,
                ),
                skipTextButton:  Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // trailing:  Text(
                //   'Login',
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: kDarkBlueColor,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                trailingFunction: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => const LoginPage(),
                  //   ),
                  // );
                },
                controllerColor: kDarkBlueColor,
                totalPage: 3,
                headerBackgroundColor: Colors.transparent,
                pageBackgroundColor: Colors.transparent,
                background: [
                  Image.asset(
                    'assets/images/slide_1.png',
                    height: 400,
                  ),
                  Image.asset(
                    'assets/images/slide_2.png',
                    height: 400,
                  ),
                  Image.asset(
                    'assets/images/slide_3.png',
                    height: 400,
                  ),
                ],
                speed: 1.8,
                pageBodies: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child:   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(
                          height: 480,
                        ),
                        Text(
                          'Order a ride',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const  SizedBox(
                          height: 20,
                        ),
                         Text(
                          'Order a ride anytime, anywhere and get picked up by nearby drives.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(
                          height: 480,
                        ),
                        Text(
                          'Offer a ride',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         Text(
                          'Going somewhere! Share your ride and make extra income while at it',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(
                          height: 480,
                        ),
                        Text(
                          'Safety and friendly',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         SizedBox(
                          height: 20,
                        ),
                         Text(
                          'Drivers IDs are verified for safety and sharing ride together can be fun.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
