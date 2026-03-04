import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/profile/bottom_sheet/personal_info_bottom_sheet.dart';
import 'package:news_app/features/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileController>(
      create: (BuildContext context) => ProfileController()..getUserData(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text("Profile")),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.pw16),
          child: Consumer<ProfileController>(
            builder: (BuildContext context, ProfileController controller, Widget? child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    width: 1.5,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundImage: controller.selectedImage == null
                                      ? AssetImage("assets/images/person.png")
                                      : FileImage(File(controller.selectedImage!.path)),
                                  radius: AppSizes.r70,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  showImageSourceDialog(context);
                                },
                                child: Container(
                                  width: AppSizes.w40,
                                  height: AppSizes.w40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppSizes.r100),
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomSvgPicture(
                                      imagePath: "assets/images/camera.svg",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.ph16),
                          Text(
                            PreferencesManager().getString(StorageKey.userName) ?? "",
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.ph12),
                    _buildProfileItem("Personal Info", "assets/images/profile.svg", () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return PersonalInfoBottomSheet();
                        },
                      ).then((value) {
                        controller.getUserData();
                      });
                    }),
                    _buildProfileItem("Language", "assets/images/language.svg", () {}),
                    _buildProfileItem(
                      "Dark Mode",
                      "assets/images/dark.svg",
                      () {},
                      withArrow: false,
                    ),
                    _buildProfileItem(controller.countryName ?? "Country", "assets/images/country.svg", () {
                      showCountryPicker(
                        context: context,
                        useSafeArea: true,
                        countryListTheme: CountryListThemeData(
                          padding: EdgeInsets.all(AppSizes.pw10),
                          inputDecoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon:Padding(
                              padding: EdgeInsets.all(AppSizes.pw18),
                              child: CustomSvgPicture.withoutColor(
                                imagePath: "assets/images/search.svg",
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) {
                          controller.saveSelectedCountry(country);
                        },
                      );
                    }),
                    _buildProfileItem(
                      "Terms & Conditions",
                      "assets/images/terms_conditions.svg",
                      () {},
                    ),
                    _buildProfileItem(
                      "Logout",
                      "assets/images/logout.svg",
                      () async {
                      //  await PreferencesManager().clear();
                        if (!context.mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      color: LightColors.primaryColor,
                      withDivider: false,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void showImageSourceDialog(BuildContext context) {
  final controller = context.read<ProfileController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Choose Image Source",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              controller.pickImage(ImageSource.camera);
            },
            child: Row(
              children: [
                CustomSvgPicture(imagePath: "assets/images/camera.svg"),
                SizedBox(width: AppSizes.w8),
                Text(
                  "Camera",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.h10),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              controller.pickImage(ImageSource.gallery);
            },
            child: Row(
              children: [
                Icon(Icons.photo_library_outlined),
                SizedBox(width: AppSizes.w8),
                Text(
                  "Gallery",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _buildProfileItem(
  String title,
  String iconPath,
  Function onTap, {
  Color? color,
  bool withDivider = true,
  bool withArrow = true,
}) {
  return Column(
    children: [
      ListTile(
        onTap: () => onTap(),
        title: Text(title, style: TextStyle(color: color)),
        contentPadding: EdgeInsets.zero,
        leading: color != null
            ? CustomSvgPicture.withoutColor(imagePath: iconPath)
            : CustomSvgPicture(imagePath: iconPath),
        trailing: withArrow
            ? CustomSvgPicture(imagePath: "assets/images/right_arrow.svg")
            : ValueListenableBuilder<ThemeMode>(
                valueListenable: ThemeController.themeNotifier,
                builder: (BuildContext context, value, Widget? child) {
                  return Switch(
                    value: value == ThemeMode.dark,
                    // check if theme is dark (true) or light (false)
                    onChanged: (bool value) async {
                      ThemeController.toggleTheme();
                    },
                  );
                },
              ),
      ),
      if (withDivider) Divider(color: Color(0xFFD1DAD6), height: 1),
    ],
  );
}
