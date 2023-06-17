import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    required this.controller,
    required this.validator,
    this.hitText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.suffixIcon,
    super.key,
  });

  final String? hitText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hitText!,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.sp,
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hitText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: suffixIcon,
            ),
            keyboardType: keyboardType,
            validator: validator,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            focusNode: focusNode,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
          ),
        ],
      ),
    );
  }
}
