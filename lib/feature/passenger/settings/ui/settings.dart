import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/cubit/theme/cubit.dart';
import 'package:flutter_starter/core/ui/widgets/icon_button.dart';
import 'package:flutter_starter/core/ui/widgets/icon_frame.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/constants/sizes.dart';
import 'package:flutter_starter/core/util/constants/strings.dart';
import 'package:flutter_starter/core/util/helpers/app_preference.dart';
import 'package:flutter_starter/core/util/helpers/functions.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.drive_eta, color: MyColors.white);
      }
      return const Icon(
        Iconsax.user,
        color: MyColors.white,
      );
    },
  );

  final MaterialStateProperty<Icon?> themeModeIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.drive_eta, color: MyColors.white);
      }
      return const Icon(
        Iconsax.user,
        color: MyColors.white,
      );
    },
  );

  bool mode = false;

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
                Text(
                  MyStrings.navAccount,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                MyIconButton(
                  size: 24,
                  icon: Iconsax.logout,
                  color: MyColors.error,
                  backgroundColor: MyFunctions.isDark(context)
                      ? MyColors.secondaryTextColorDark
                      : MyColors.primaryLightBG,
                ),
              ],
            ),
            SizedBox(
              height: MySizes.xl,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.primaryLightBG, // Set the background color
                      borderRadius: BorderRadius.circular(
                          4), // Optional: Set border radius
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "${MyStrings.p_mode} \n",
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: MyStrings.p_mode_caption,
                                style: Theme.of(context).textTheme.labelSmall),
                          ]),
                        ),
                        Switch(
                            thumbIcon: thumbIcon,
                            activeColor: MyColors.primary,
                            inactiveTrackColor: MyColors.secondaryTextColorDark,
                            value: mode,
                            onChanged: (bool value) {
                              setState(() {
                                mode = value;
                              });
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MySizes.xl,
                  ),
                  const SettingsTiles(
                    title: "Personal info",
                    icon: Iconsax.user,
                  ),
                  SizedBox(
                    height: MySizes.xm,
                  ),
                  const SettingsTiles(
                    title: "Dark mode",
                    icon: Iconsax.moon,
                    widget: ThemeSwitch(),
                  ),
                  SizedBox(
                    height: MySizes.xm,
                  ),
                  const SettingsTiles(
                    title: "Terms & Privacy",
                    icon: Iconsax.lock,
                  ),
                  SizedBox(
                    height: MySizes.xm,
                  ),
                  const SettingsTiles(
                    title: "Give us feedback",
                    icon: Iconsax.edit,
                  ),
                  SizedBox(
                    height: MySizes.xm,
                  ),
                  const SettingsTiles(
                    title: "Share app",
                    icon: Iconsax.share,
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

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({
    super.key,
    this.size = 24,
    this.color,
    this.backgroundColor = MyColors.primaryLightBG,
    required this.icon,
    required this.title,
    this.widget,
  });

  final double? size;
  final Widget? widget;
  final Color? color;
  final Color? backgroundColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MyColors.white, // Set the background color
        borderRadius: BorderRadius.circular(4), // Optional: Set border radius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconFrame(
                size: size,
                icon: icon,
                color: MyColors.primaryTextColorLight,
                backgroundColor: backgroundColor,
              ),
              SizedBox(
                width: MySizes.xm,
              ),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: MyColors.primaryTextColorLight)),
            ],
          ),
          widget == null
              ? IconFrame(
                  size: size,
                  icon: Iconsax.arrow_right_3,
                  color: MyColors.primaryTextColorLight,
                  backgroundColor: Colors.transparent,
                )
              : SizedBox(
                  child: widget,
                ),
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  final MaterialStateProperty<Icon?> themeModeIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode, color: MyColors.white);
      }
      return const Icon(
        Iconsax.sun_1,
        color: MyColors.white,
      );
    },
  );
  // bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);

    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
        return Switch(
            thumbIcon: themeModeIcon,
            activeColor: MyColors.primary,
            inactiveTrackColor: MyColors.lightBackground,
            value: themeMode == ThemeModeEnum.dark,
            onChanged: (value) {
              ThemeModeEnum newTheme =
                  value ? ThemeModeEnum.dark : ThemeModeEnum.light;
              themeCubit.toggleTheme(newTheme);

            });
      },
    );
  }
}
