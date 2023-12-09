import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/images/logo.png"),
                width: 40.w,
              ),
              Expanded(
                child: OnBoardingSlider(
                  finishButtonText: 'Get Started',
                  finishButtonStyle: const FinishButtonStyle(
                    backgroundColor: MyColors.primary,
                  ),
                  onFinish: () {
                    AppRoute.auth.go(context);
                  },
        
                  controllerColor: MyColors.secondaryTextColorLight,
                  totalPage: 3,
                  headerBackgroundColor: Colors.transparent,
                  pageBackgroundColor: Colors.transparent,
                  centerBackground: true,
                  // imageVerticalOffset: 5.h,
                  hasFloatingButton: true,
        
        
                  background: [
                    Image.asset(
                      'assets/images/slide_1.png',
                      height: 40.h,
                    ),
                    Image.asset(
                      'assets/images/slide_2.png',
                      height: 40.h,
                    ),
                    Image.asset(
                      'assets/images/slide_3.png',
                      height: 40.h,
                    ),
                  ],
                  speed: 1.8,
                  pageBodies: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            'Order a ride',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: MyColors.primary, fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Order a ride anytime, anywhere and get picked up by nearby drives.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            'Offer a ride',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: MyColors.primary, fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Going somewhere! Share your ride and make extra income while at it',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12.sp,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            'Safety and friendly',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: MyColors.primary, fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Drivers IDs are verified for safety and sharing ride together can be fun.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 12.sp),
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
