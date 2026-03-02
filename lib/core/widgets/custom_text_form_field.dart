import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final int? maxLines;

  final String hintText;
  final Function(String?)? validator;
  final String title;
  final Widget? suffix;
  final bool obscureText;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.validator,
    required this.title,
    this.suffix,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xFF141414))),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          style: Theme.of(context).textTheme.labelMedium,
          validator: widget.validator != null
              ? (String? value) => widget.validator!(value)
              : null,
          obscureText: widget.obscureText && !_isVisible,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined),
                  )
                : null,
          ),
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
