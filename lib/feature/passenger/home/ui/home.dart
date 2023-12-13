import 'package:flutter/material.dart';
import 'package:flutter_starter/core/ui/widgets/icon_button.dart';
import 'package:flutter_starter/core/ui/widgets/round_image.dart';
import 'package:flutter_starter/core/util/constants/sizes.dart';
import 'package:flutter_starter/core/util/constants/strings.dart';
import 'package:flutter_starter/feature/passenger/home/ui/widgets/find_route_box.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MySizes.layoutHorizontal,
            horizontal: MySizes.layoutHorizontal),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const RoundImage(size: 48,),
                    SizedBox(
                      width: MySizes.wxm,
                    ),
                    Text(
                      '${MyStrings.greeting}, Taiwo',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const MyIconButton(size: 24, icon: Iconsax.notification,),
              ],
            ),
        SizedBox(
          height: MySizes.xm,
        ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Text(
                    MyStrings.homeText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: MySizes.xs,
                  ),
                  RouteBox(),
                  SizedBox(
                    height: MySizes.xl,
                  ),
                  Text(
                    MyStrings.myTrip,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
