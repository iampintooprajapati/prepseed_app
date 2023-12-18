import 'package:flutter/material.dart';
import 'package:prepseed_app/ui/auth/login.dart';
import 'package:prepseed_app/utlis/app_colors.dart';
import 'package:prepseed_app/utlis/app_constant.dart';
import 'package:prepseed_app/utlis/app_fonts.dart';
import 'package:prepseed_app/utlis/app_imagestring.dart';
import 'package:prepseed_app/widgets/bg_container.dart';
import 'package:prepseed_app/widgets/custom_icon_button.dart';
import 'package:prepseed_app/widgets/custom_input_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formRegKay = GlobalKey<FormState>();
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BgContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ScrollConfiguration(
          behavior: const MaterialScrollBehavior(),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            top: MediaQuery.of(context).size.height * 0.42),
                        child: Form(
                          key: formRegKay,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register",
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  AppConstant.email,
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomInputForm(
                                  hint: "Enter Email",
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  AppConstant.password,
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: AppFonts.nunitoRegular,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                CustomInputForm(
                                  hint: "Enter password",
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
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
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Future.delayed(
                                    const Duration(seconds: 2),
                                    () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen())));
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Already Member?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ${AppConstant.login}',
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
                                  Future.delayed(
                                      const Duration(seconds: 2),
                                      () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen())));
                                },
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            strokeAlign: 1.0,
                                            color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: const Text("Register"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
