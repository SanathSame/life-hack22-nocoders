import 'package:flutter/material.dart';

import 'constants/app_colours.dart';

class TextInputBox extends StatelessWidget {
  final double leftPadding;
  final double rightPadding;
  final double margin;
  final double width;
  final double height;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final bool hidden;
  final Color color;
  final Function function;
  final bool disabled;

  const TextInputBox(
      {Key? key,
      this.leftPadding = 30,
      this.rightPadding = 30,
      this.margin = 0,
      required this.width,
      required this.height,
      required this.controller,
      required this.hint,
      this.disabled = false,
      this.icon,
      this.hidden = false,
      required this.function,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(4, 4),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      width: width,
      height: height,
      child: TextFormField(
        readOnly: disabled,
        cursorColor: AppColours.greyTextColour,
        obscureText: hidden,
        controller: controller,
        style: const TextStyle(color: Colors.grey),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: theme.textTheme.subtitle1!.copyWith(color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              function(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: rightPadding),
              child: Material(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: (icon != null)
                      ? Icon(
                          icon,
                          color: theme.primaryColor,
                          size: 20,
                        )
                      : const SizedBox()),
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: leftPadding,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
