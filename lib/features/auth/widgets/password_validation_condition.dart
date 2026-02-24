import 'package:flutter/material.dart';

class PasswordValidationConditions extends StatelessWidget {
  final bool hasUpper;
  final bool hasLower;
  final bool hasNumber;
  final bool hasSpecial;
  final bool hasMinLength;

  const PasswordValidationConditions({
    super.key,
    required this.hasMinLength,
    required this.hasLower,
    required this.hasUpper,
    required this.hasNumber,
    required this.hasSpecial,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPasswordRule("At least 8 characters", hasMinLength, context),
        buildPasswordRule("One uppercase letter", hasUpper, context),
        buildPasswordRule("One lowercase letter", hasLower, context),
        buildPasswordRule("One number", hasNumber, context),
        buildPasswordRule("One special character", hasSpecial, context),
      ],
    );
  }

  Widget buildPasswordRule(String text, bool isValid, BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle_outline : Icons.cancel_outlined,
          color: isValid ? Colors.green : Theme.of(context).primaryColor,
          size: 18,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}