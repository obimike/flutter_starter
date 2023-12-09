
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/constants/image_string.dart';
import 'package:flutter_starter/core/util/constants/sizes.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  void _onDotClick(index) {
    _pageController.jumpToPage(index);
  }

  void _onSkip() {
    _pageController.jumpToPage(2);
  }

  void _onNextClick(BuildContext context) {
    if (currentIndex == 2) {
      context.go(AppRoute.auth.path);
    }else{
      _pageController.jumpToPage(currentIndex + 1);
    }
  }

  void _onPageChange(index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChange,
              pageSnapping: false,
              children: const [
                OnBoarding(
                    image: MyImages.onboardingImages_1,
                    title: 'Order a ride',
                    subtitle:
                        'Order a ride anytime, anywhere and get picked up by nearby drives.'),
                OnBoarding(
                    image: MyImages.onboardingImages_2,
                    title: 'Offer a ride',
                    subtitle:
                        'Going somewhere! Share your ride and make extra income while at it.'),
                OnBoarding(
                    image: MyImages.onboardingImages_3,
                    title: 'Safety and friendly',
                    subtitle:
                        'Drivers IDs are verified for safety and sharing ride together can be fun.')
              ],
            ),
            Positioned(
                top: MySizes.layoutVertical,
                right: MySizes.layoutHorizontal,
                child: TextButton(
                  onPressed: _onSkip,
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )),
            Positioned(
              bottom: MySizes.xl,
              left: MySizes.layoutHorizontal,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                onDotClicked: _onDotClick,
                effect: ExpandingDotsEffect(
                    dotColor: MyColors.secondaryTextColorLight,
                    activeDotColor: MyColors.primary,
                    dotHeight: MySizes.xs),
              ),
            ),
            Positioned(
                bottom: MySizes.layoutVertical,
                right: MySizes.layoutHorizontal,
                child: ElevatedButton(
                  onPressed: ()=> _onNextClick(context),
                  style: currentIndex == 2
                      ? ElevatedButton.styleFrom(elevation: 2)
                      : ElevatedButton.styleFrom(shape: const CircleBorder()),
                  child: currentIndex == 2
                      ? const Text("Get Started")
                      : const Icon(Icons.arrow_forward_ios_sharp),
                )),
          ],
        ),
      ),
    );
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MySizes.layoutVertical,
          horizontal: MySizes.layoutHorizontal),
      child: Column(
        children: [
          SizedBox(
            height: MySizes.ml,
          ),
          Image(image: AssetImage(image)),
          SizedBox(
            height: MySizes.ms,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: MyColors.primary),
          ),
          SizedBox(
            height: MySizes.xm,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
