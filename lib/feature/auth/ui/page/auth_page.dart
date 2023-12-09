import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_starter/core/navigation/route.dart';
import 'package:flutter_starter/core/util/constants/colors.dart';
import 'package:flutter_starter/feature/auth/bloc/auth/auth_bloc.dart';
import 'package:flutter_starter/feature/auth/bloc/auth/auth_event.dart';
import 'package:flutter_starter/feature/auth/bloc/auth/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print(state.status);
          if (state.status == AuthStatus.existingUserSuccess) {}
          if (state.status == AuthStatus.newUserSuccess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.push(
                  context.namedLocation(AppRoute.numberVerification.path));
            });
          }
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 160,
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
                            height: 1.h,
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
                          IntlPhoneField(
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),
                              focusColor: MyColors.primary,
                            ),
                            cursorColor: MyColors.primary,
                            initialCountryCode: 'NG',
                            onChanged: (phone) {
                              context.read<AuthBloc>().add(
                                  PhoneNumberChangedEvent(
                                      phone: phone.number,
                                      countryCode: phone.countryCode,
                                      countryISOCode: phone.countryISOCode));
                            },
                            onCountryChanged: (country) {
                              print('Country changed to: ${country.name}');
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () => (state.status ==
                                      AuthStatus.loading)
                                  ? null
                                  : context
                                      .read<AuthBloc>()
                                      .add(const ContinueButtonPressedEvent()),
                              icon: (state.status == AuthStatus.loading)
                                  ? const Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const SizedBox(),
                              label: SizedBox(
                                // width: dynamicWidth,
                                child: (state.status == AuthStatus.loading)
                                    ? const Text(
                                        "Authenticating, please wait...",
                                        textAlign: TextAlign.center,
                                      )
                                    : const Text(
                                        "Continue",
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h,),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'By clicking continue you have agreed to our',
                                  style: Theme.of(context).textTheme.labelMedium,
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
