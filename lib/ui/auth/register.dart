import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepseed_app/bloc/register/register_bloc.dart';
import 'package:prepseed_app/bloc/register/register_event.dart';
import 'package:prepseed_app/bloc/register/register_state.dart';
import 'package:prepseed_app/models/auth_model.dart';
import 'package:prepseed_app/ui/auth/login.dart';
import 'package:prepseed_app/utlis/app_colors.dart';
import 'package:prepseed_app/utlis/app_constant.dart';
import 'package:prepseed_app/utlis/app_fonts.dart';
import 'package:prepseed_app/utlis/app_imagestring.dart';
import 'package:prepseed_app/utlis/app_toast.dart';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late RegisterBloc registerBloc;

  bool _obsecureText = true;

  void _toggleObscured() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  void initState() {
    registerBloc = context.read<RegisterBloc>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                child: BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                  if (state is RegisterLoadingState) {
                    const CircularProgressIndicator();
                  }
                  if (state is RegisterErrorState) {
                    AppToast.instance.showError(context, state.msg);
                  }

                  if (state is RegisterSuccessState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  }
                }, builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  return Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              top: MediaQuery.of(context).size.height * 0.42),
                          child: Form(
                            key: formRegKay,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Register",
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
                                    obscureText: _obsecureText,
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == "" ||
                                          (value?.trim().isEmpty ?? true)) {
                                        return "Please enter password";
                                      } else {
                                        return null;
                                      }
                                    },
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: _toggleObscured,
                                        child: Icon(
                                          _obsecureText
                                              ? Icons.lock
                                              : Icons.remove_red_eye,
                                          size: 12,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
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
                                                  const LoginScreen())));
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
                                    print("click");
                                    print("${emailController.text.toString()}");
                                    FocusNode? focusNode =
                                        FocusManager.instance.primaryFocus;
                                    if (focusNode != null) {
                                      if (focusNode.hasPrimaryFocus) {
                                        focusNode.unfocus();
                                      }
                                    }
                                    if (formRegKay.currentState?.validate() ??
                                        false) {
                                      registerBloc.add(RegisterSubmitEvent(
                                        authModel: AuthModel(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim()),
                                      ));
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
                                              BorderRadius.circular(8))),
                                  child: const Text("Register"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
