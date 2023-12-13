import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/core/util/constants/image_string.dart';
import 'package:flutter_starter/core/util/constants/sizes.dart';
import 'package:flutter_starter/feature/auth/cubit/verify_code/cubit.dart';
import 'package:flutter_starter/feature/auth/cubit/verify_code/state.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';

class NumberVerification extends StatelessWidget {
  final String? phoneNumber;
  const NumberVerification({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
        listenWhen: (prev, current) => prev.status != current.status,
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == VerifyCodeStatus.success) {
            EasyLoading.dismiss();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.go(AppRoute.navigationMenu.path);
            });
          }
          if (state.status == VerifyCodeStatus.loading) {
            EasyLoading.show(status: 'Verifying, please wait...',);
          }
          if (state.status == VerifyCodeStatus.failure) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                              width: MySizes.wll + MySizes.wll,
                            ),
                            Image(
                              image: const AssetImage(MyImages.brand),
                              height: MySizes.ms,
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
                        SizedBox(
                          height: MySizes.xs,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'A four digit code has been sent to ',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            TextSpan(
                              text: phoneNumber,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: MySizes.xl,
                        ),
                        if (state.status == VerifyCodeStatus.failure)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: MySizes.xm),
                              child: Text(
                                state.message,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Pinput(
                              obscureText: true,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              separatorBuilder: (index) =>
                                  const SizedBox(width: 16),
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                debugPrint('onCompleted: $pin');
                                context.read<VerifyCodeCubit>().codeComplete();
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                                context
                                    .read<VerifyCodeCubit>()
                                    .codeChanged(value);
                              },
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                textStyle:
                                    Theme.of(context).textTheme.titleLarge,
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
          );
        },
      ),
    );
  }
}
