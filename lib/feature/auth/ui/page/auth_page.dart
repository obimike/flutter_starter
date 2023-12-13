import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/core/util/constants/image_string.dart';
import 'package:flutter_starter/core/util/constants/sizes.dart';
import 'package:flutter_starter/feature/auth/cubit/auth/cubit.dart';
import 'package:flutter_starter/feature/auth/cubit/auth/state.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (prev, current) => prev.status != current.status,
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == AuthStatus.success) {
            EasyLoading.dismiss();
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.push(context.namedLocation(
                  AppRoute.numberVerification.path,
                  pathParameters: {"phoneNumber": state.phone}));
            });
          }
          if (state.status == AuthStatus.loading) {
            EasyLoading.show(
              status: 'Authenticating, please wait...',
            );
          }
          if (state.status == AuthStatus.failure) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {

          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MySizes.layoutHorizontal,
                horizontal: MySizes.layoutHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(MyImages.brand),
                      height: MySizes.ms,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Enter your phone number',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: MySizes.xs,
                          ),
                          Text(
                            'A verification code will be sent to you to verify this number.',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          if (state.status == AuthStatus.failure)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
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
                          Form(
                            key: _formKey,
                            child: IntlPhoneField(
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                focusColor: MyColors.primary,
                              ),
                              cursorColor: MyColors.primary,
                              initialCountryCode: 'NG',
                              onChanged: (phone) {
                                context.read<AuthCubit>().numberChanged(
                                    phone.completeNumber.trim(),
                                    phone.countryCode,
                                    phone.countryISOCode);
                              },
                              onCountryChanged: (country) {
                                context
                                    .read<AuthCubit>()
                                    .countryChanged(country.name);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _formKey.currentState!.validate()
                                  ? context.read<AuthCubit>().buttonClicked()
                                  : null,
                              child: const Text(
                                "Continue",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'By clicking continue you have agreed to our',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                GestureDetector(
                                  onDoubleTap: () {},
                                  child: Text(
                                    'Terms and conditions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: MyColors.secondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
