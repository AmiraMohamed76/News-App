import 'package:flutter/material.dart';

class ViewAllComponent extends StatelessWidget {
  final  String title;
  final  Color? titleColor;
  final Function onTap;
  const ViewAllComponent({super.key, required this.title, this.titleColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: titleColor ?? Color(0xFFFFFCFC),
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: () => onTap(),
            child: Text(
              "View all",
              style: TextStyle(
                fontSize: 14,
                color: titleColor ?? Color(0xFFFFFCFC),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                decorationColor: titleColor ?? Color(0xFFFFFCFC),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
