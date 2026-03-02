import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';
import 'package:news_app/features/auth/register_screen.dart';
import 'package:news_app/features/navigation/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? errorMessage;

  void login() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 3));

    final savedEmail = PreferencesManager().getString(StorageKey.userEmail);
    final savedPassword = PreferencesManager().getString(StorageKey.userPassword);

    if (savedEmail == null || savedPassword == null) {
      setState(() {
        isLoading = false;
        errorMessage = "No Account Found Please Register First";
      });

      return;
    }

    if (savedEmail != emailController.text.trim() ||
        savedPassword != passwordController.text.trim()) {
      setState(() {
        isLoading = false;
        errorMessage = "Incorrect Email or Password";
      });

      return;
    }

    await PreferencesManager().setBool(StorageKey.isLoggedIn, true);

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MainScreen();
        },
      ),
    );

    setState(() {
      isLoading = false;
      errorMessage = null;
    });
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
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background_image.png'),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.pw16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: AppSizes.h45,
                        ),
                      ),
                      SizedBox(height: AppSizes.ph40),
                      Text(
                        "Welcome to Newts",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppSizes.ph16),
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
                      SizedBox(height: AppSizes.ph12),
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
                        obscureText: true,
                      ),
                      SizedBox(height: AppSizes.ph12),
                      if (errorMessage != null)
                        Text(
                          errorMessage!,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      SizedBox(height: AppSizes.ph20),
                      CustomButton(
                        btnTitle: 'Sign In',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            login();
                          }
                        },
                        isLoading: isLoading,
                      ),
                      SizedBox(height: AppSizes.ph24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account ?',
                            style: Theme.of(context).textTheme.labelMedium
                          ),
                          SizedBox(width: AppSizes.pw8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return RegisterScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.titleSmall,
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
