import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/widgets/custom_button.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';

class PersonalInfoBottomSheet extends StatefulWidget {
  const PersonalInfoBottomSheet({super.key});

  @override
  State<PersonalInfoBottomSheet> createState() => _PersonalInfoBottomSheetState();
}

class _PersonalInfoBottomSheetState extends State<PersonalInfoBottomSheet> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _loadUserData();
  }

  void _loadUserData() {
    userNameController.text = PreferencesManager().getString(StorageKey.userName) ?? "";
    emailController.text = PreferencesManager().getString(StorageKey.userEmail) ?? "";
  }

  void _saveUserData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));
    if(_formKey.currentState?.validate() ?? false) {
      await PreferencesManager().setString(
          StorageKey.userName, userNameController.text);
      await PreferencesManager().setString(
          StorageKey.userEmail, emailController.text);
      setState(() {
        isLoading = false;
      });

      if(!context.mounted) return;
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.r16),
              topRight: Radius.circular(AppSizes.r16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.pw16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: AppSizes.w32,
                        height: AppSizes.h4,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(AppSizes.r100),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.ph16),
                    Text(
                      "Profile Info",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: AppSizes.ph16),
                    CustomTextFormField(
                      controller: userNameController,
                      hintText: 'e.g. Ahmed Mohamed',
                      title: 'User Name',
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please Enter your Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSizes.ph12),
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
                    SizedBox(height: AppSizes.ph16),
                    CustomButton(
                      btnTitle: 'Save',
                      onPressed: () {
                        _saveUserData();
                      },
                      isLoading: isLoading,
                    ),
                    SizedBox(height: AppSizes.ph16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
