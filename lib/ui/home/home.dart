import 'package:flutter/material.dart';
import 'package:prepseed_app/ui/auth/login.dart';
import 'package:prepseed_app/utlis/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(strokeAlign: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.circular(8))),
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
