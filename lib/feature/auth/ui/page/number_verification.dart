import 'package:flutter/material.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:sizer/sizer.dart';

class NumberVerification extends StatelessWidget {
  const NumberVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              context.push(AppRoute.auth.path);
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                color: MyColors.primaryTextColorLight)),
                        SizedBox(
                          width: 10.h,
                        ),
                        const Image(
                          image: AssetImage("assets/images/logo.png"),
                          width: 160,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Enter verification code',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'A four(4) digit code has been sent to +2349034722110.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pinput(
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          separatorBuilder: (index) =>
                              const SizedBox(width: 16),
                          // validator: (value) {
                          //   return value == '2222' ? null : 'Pin is incorrect';
                          // },
                          // onClipboardFound: (value) {
                          //   debugPrint('onClipboardFound: $value');
                          //   pinController.setText(value);
                          // },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: Theme.of(context).textTheme.titleLarge,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: MyColors.secondaryTextColorLight),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive yet?',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onDoubleTap: () {},
                            child: Text(
                              'Resend code',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: MyColors.secondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
