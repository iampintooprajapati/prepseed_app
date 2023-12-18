import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepseed_app/bloc/login/auth_bloc.dart';
import 'package:prepseed_app/bloc/login/auth_event.dart';
import 'package:prepseed_app/bloc/login/auth_state.dart';
import 'package:prepseed_app/models/auth_model.dart';
import 'package:prepseed_app/ui/auth/register.dart';
import 'package:prepseed_app/ui/intro/introduction.dart';
import 'package:prepseed_app/utlis/app_colors.dart';
import 'package:prepseed_app/utlis/app_constant.dart';
import 'package:prepseed_app/utlis/app_fonts.dart';
import 'package:prepseed_app/utlis/app_imagestring.dart';
import 'package:prepseed_app/widgets/bg_container.dart';
import 'package:prepseed_app/widgets/custom_input_form.dart';

import '../../widgets/custom_icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKay = GlobalKey<FormState>();

  final controller = ScrollController();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  late AuthBloc loginBloc;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BgContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoadingState) {
                  const CircularProgressIndicator();
                }
                if (state is AuthErrorState) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroductionScreen()));
                }

                if (state is AuthSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ScrollConfiguration(
                  behavior: const MaterialScrollBehavior(),
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller,
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Form(
                          key: formKay,
                          child: Stack(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.05,
                                      top: MediaQuery.of(context).size.height *
                                          0.42),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          AppConstant.login,
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontSize: 30,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          AppConstant.email,
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        CustomInputForm(
                                          hint: "Enter Email",
                                          controller: emailController,
                                          validator: (value) {
                                            if (value?.trim().isEmpty ?? true) {
                                              return "Please enter email address";
                                            } else if (!RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value ?? "")) {
                                              return "Enter valid email address";
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          AppConstant.password,
                                          style: TextStyle(
                                            color: AppColors.blue,
                                            fontSize: 12,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: AppFonts.nunitoRegular,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        CustomInputForm(
                                          hint: "Enter password",
                                          controller: passwordController,
                                          validator: (value) {
                                            if (value == "" ||
                                                (value?.trim().isEmpty ??
                                                    true)) {
                                              return "Please enter password";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: const Text(
                                            AppConstant.forgotPassword,
                                            style: TextStyle(
                                              color: AppColors.blue,
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontFamily:
                                                  AppFonts.nunitoRegular,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Row(
                                          children: [
                                            CustomIconButton(
                                              icon: AppImageString.icGoogle,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CustomIconButton(
                                              icon: AppImageString.icFacebook,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CustomIconButton(
                                              icon: AppImageString.icApple,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                              Positioned(
                                bottom: 0,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterScreen()));
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'New Here?',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' Register',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(18),
                                        height: 45,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            print("click");
                                            print(
                                                "${emailController.text.toString()}");
                                            FocusNode? focusNode = FocusManager
                                                .instance.primaryFocus;
                                            if (focusNode != null) {
                                              if (focusNode.hasPrimaryFocus) {
                                                focusNode.unfocus();
                                              }
                                            }
                                            if (formKay.currentState
                                                    ?.validate() ??
                                                false) {
                                              AuthSubmitEvent(
                                                loginModel: AuthModel(
                                                    email: emailController.text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim()),
                                              );
                                            }
                                          },
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: AppColors.blue,
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      strokeAlign: 1.0,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          child: const Text("Login"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
