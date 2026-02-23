import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/logo.png', height: 45),
                ),
                SizedBox(height: 40),
                Text(
                  "Welcome to Newts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'usama@gmail.com',
                  title: 'Email',
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter your Email";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: '*************',
                  title: 'Password',
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please Enter your Password";
                    }
                    return null;
                  },
                ),
                CustomButton(btnTitle: 'Sign In', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
