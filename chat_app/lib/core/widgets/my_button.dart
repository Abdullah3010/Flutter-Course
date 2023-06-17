import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).colorScheme.primary,
        minWidth: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
