import 'package:flutter/material.dart';
import 'package:prepseed_app/ui/auth/login.dart';
import 'package:prepseed_app/utlis/app_colors.dart';
import 'package:prepseed_app/utlis/app_imagestring.dart';
import 'package:prepseed_app/widgets/bg_container.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BgContainer(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.05,
                top: MediaQuery.of(context).size.height * 0.4),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Image.asset(AppImageString.icLogoText),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(18),
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            strokeAlign: 1.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(8))),
                child: const Text("Get Started"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
