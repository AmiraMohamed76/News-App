import 'package:flutter/material.dart';

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
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 48),
      ),
      child: isLoading? CircularProgressIndicator(color: Colors.white,padding: EdgeInsets.all(4)):Text(btnTitle),
    );
  }
}
