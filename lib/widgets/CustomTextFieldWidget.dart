import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.colorSchemeTheme,
    required this.text,
    required this.controller,
  });

  final ColorScheme colorSchemeTheme;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorSchemeTheme.primaryContainer,
        hintText: text,
        hintStyle: TextStyle(color: colorSchemeTheme.onPrimaryContainer),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeTheme.primaryContainer, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeTheme.error, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeTheme.primaryContainer, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: colorSchemeTheme.primaryContainer, width: 1.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
