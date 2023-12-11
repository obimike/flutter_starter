import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.push(
                  context.namedLocation(AppRoute.numberVerification.path));
            });
          }
        },
        builder: (context, state) {
          // debugPrint(state.status as String?);

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
                                    phone.completeNumber,
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
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  (state.status == AuthStatus.loading)
                                      ? null
                                      : _formKey.currentState!.validate()
                                          ? context
                                              .read<AuthCubit>()
                                              .buttonClicked()
                                          : null,
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
