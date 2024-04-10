import 'dart:io';

import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.colorSchemeTheme,
    this.onPressed,
    this.text,
    this.icon,
    required this.isLoading,
  });

  final ColorScheme colorSchemeTheme;
  final Function()? onPressed;
  final String? text;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Widget displayButton = (!isLoading)
        ? TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: colorSchemeTheme.onPrimary,
            ),
            label: Text(
              text!,
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorSchemeTheme.onPrimary,
              ),
            ))
        : TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: CircularProgressIndicator(
              color: colorSchemeTheme.onPrimary,
            ),
          );

    return displayButton;
  }
}
