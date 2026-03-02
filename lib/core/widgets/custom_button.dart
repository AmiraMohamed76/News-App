import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final Function onPressed;
  final bool isLoading;
  const CustomButton({super.key, required this.btnTitle, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {
        onPressed();
      } ,
      child: isLoading? CircularProgressIndicator(color: Colors.white,padding: EdgeInsets.all(AppSizes.pw4)):Text(btnTitle),
    );
  }
}
