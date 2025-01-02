import 'package:flutter/material.dart';
import 'package:masar_app/constant.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final double width;
  final double height;
  final Color backgroundColor;
  final double radius;
  final Color textColor;
  final double startPadding;
  final double endPadding;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final IconData? suffixIcon;
  final String validatorMessage;
  final double inputFontSize;
  final Color inputColor;
  final int? maxLength;
  final Function()? suffixPressed;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    required this.hintText,
    this.width = double.infinity,
    this.height = 68,
    this.backgroundColor = kPrimaryBackGroundColor,
    this.radius = 20.0,
    this.textColor = kPrimaryTextColor,
    this.startPadding = 20.0,
    this.endPadding = 10.0,
    this.keyboardType,
    this.isObscureText = false,
    this.suffixIcon,
    required this.validatorMessage,
    this.inputFontSize = 20.0,
    this.inputColor = Colors.black,
    this.maxLength,
    this.controller,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsetsDirectional.only(
        start: startPadding,
        end: endPadding,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        buildCounter: (context,
            {required currentLength, required isFocused, required maxLength}) {
          return null; // Hide the character counter
        },
        style: TextStyle(
          fontSize: inputFontSize,
          color: inputColor,
        ),
        keyboardType: keyboardType,
        obscureText: isObscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: textColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                    color: kPrimaryTextColor,
                  ),
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
