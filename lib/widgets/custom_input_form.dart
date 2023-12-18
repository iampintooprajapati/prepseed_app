import 'package:flutter/material.dart';
import 'package:prepseed_app/utlis/app_colors.dart';
import 'package:prepseed_app/utlis/app_fonts.dart';

class CustomInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? label;
  final String hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomInputForm(
      {super.key,
      this.icon,
      this.label,
      required this.hint,
      this.obscureText,
      this.keyboardType,
      this.maxLines,
      this.onTap,
      this.readOnly,
      this.validator,
      this.suffixIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly ?? false,
        onTap: onTap,
        style:
            const TextStyle(color: AppColors.blue, fontWeight: FontWeight.w900),
        maxLines: maxLines ?? 1,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validator,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          disabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(strokeAlign: 1.0, color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(strokeAlign: 1.0, color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(strokeAlign: 1.0, color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(strokeAlign: 1.0, color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(strokeAlign: 1.0, color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          hintText: hint,
          hintStyle: TextStyle(
              color: AppColors.blue.withOpacity(0.50),
              fontFamily: AppFonts.nunitoRegular,
              fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
