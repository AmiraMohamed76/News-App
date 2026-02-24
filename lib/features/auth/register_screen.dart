import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/auth/widgets/password_validation_condition.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/navigation/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? errorMessage;
  bool isLoading = false;

  bool hasUpper = false;
  bool hasLower = false;
  bool hasNumber = false;
  bool hasSpecial = false;
  bool hasMinLength = false;

  void validatePassword(String value) {
    setState(() {
      hasUpper = value.contains(RegExp(r'[A-Z]'));
      hasLower = value.contains(RegExp(r'[a-z]'));
      hasNumber = value.contains(RegExp(r'[0-9]'));
      hasSpecial = value.contains(RegExp(r'[@$!%*?&]'));
      hasMinLength = value.length >= 8;
    });
  }

  void register() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 3));

    final savedEmail = PreferencesManager().getString("user_email");

    if (savedEmail != null && savedEmail == emailController.text.trim()) {
      setState(() {
        isLoading = false;
        errorMessage = "User Already Registered";
      });
    } else {
      await PreferencesManager().setString(
        "user_email",
        emailController.text.trim(),
      );
      await PreferencesManager().setString(
        "user_password",
        passwordController.text.trim(),
      );
      await PreferencesManager().setBool("is_logged_in", true);
      setState(() {
        isLoading = false;
      });
      if(!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 45,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Welcome to Newts",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: 'usama@gmail.com',
                        title: 'Email',
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter your Email";
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return "Please Enter valid Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: '*************',
                        title: 'Password',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter Password";
                          }
                          if (!(hasUpper &&
                              hasLower &&
                              hasNumber &&
                              hasSpecial &&
                              hasMinLength)) {
                            return "Password is not strong enough";
                          }
                          return null;
                        },
                        onChanged: validatePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 8),
                      PasswordValidationConditions(
                        hasLower: hasLower,
                        hasUpper: hasUpper,
                        hasMinLength: hasMinLength,
                        hasNumber: hasNumber,
                        hasSpecial: hasSpecial,
                      ),
                      SizedBox(height: 12),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        hintText: '*************',
                        title: 'Confirm Password',
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter your Password";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 12),
                      if(errorMessage != null) Text(errorMessage!, style: TextStyle(color: Theme.of(context).primaryColor),),
                      SizedBox(height: 20),
                      CustomButton(
                        btnTitle: 'Sign Up',
                        onPressed: () {
                          print("Button");
                          if (_formKey.currentState?.validate() ?? false) {
                            register();
                          }
                        },
                        isLoading: isLoading,
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account ?',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
