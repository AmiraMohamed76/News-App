import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/profile/controller/profile_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileController>(
      create: (BuildContext context) => ProfileController(),
      child: Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.pw16),
          child: Consumer<ProfileController>(
            builder:
                (
                  BuildContext context,
                  ProfileController controller,
                  Widget? child,
                ) {
                  return Column(
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
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        controller.selectedImage == null
                                        ? AssetImage("assets/images/person.png")
                                        : FileImage(
                                            File(
                                              controller.selectedImage!.path,
                                            ),
                                          ),
                                    radius: AppSizes.r60,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    showImageSourceDialog(context);
                                  },
                                  child: Container(
                                    width: AppSizes.w36,
                                    height: AppSizes.h40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppSizes.r100,
                                      ),
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
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
                            SizedBox(height: AppSizes.h28),
                            Text(
                              PreferencesManager().getString(
                                    StorageKey.userEmail,
                                  ) ??
                                  "",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSizes.h24),
                      ListTile(
                        title: Text("Personal Info"),
                        contentPadding: EdgeInsets.zero,
                        leading: CustomSvgPicture(
                          imagePath: "assets/images/profile.svg",
                        ),
                        trailing: CustomSvgPicture(
                          imagePath: "assets/images/right_arrow.svg",
                        ),
                      ),
                      Divider(color: Color(0xFFD1DAD6), height: 1),
                      ListTile(
                        title: Text("Language"),
                        contentPadding: EdgeInsets.zero,
                        leading: CustomSvgPicture(
                          imagePath: "assets/images/language.svg",
                        ),
                        trailing: CustomSvgPicture(
                          imagePath: "assets/images/right_arrow.svg",
                        ),
                      ),
                      Divider(color: Color(0xFFD1DAD6), height: 1),
                      ListTile(
                        title: Text("Country"),
                        contentPadding: EdgeInsets.zero,
                        leading: CustomSvgPicture(
                          imagePath: "assets/images/country.svg",
                        ),
                        trailing: CustomSvgPicture(
                          imagePath: "assets/images/right_arrow.svg",
                        ),
                      ),
                      Divider(color: Color(0xFFD1DAD6), height: 1),
                      ListTile(
                        title: Text("Terms & Conditions"),
                        contentPadding: EdgeInsets.zero,
                        leading: CustomSvgPicture(
                          imagePath: "assets/images/terms_conditions.svg",
                        ),
                        trailing: CustomSvgPicture(
                          imagePath: "assets/images/right_arrow.svg",
                        ),
                      ),
                      Divider(color: Color(0xFFD1DAD6), height: 1),
                      ListTile(
                        title: Text("Logout"),
                        textColor: LightColors.primaryColor,
                        contentPadding: EdgeInsets.zero,
                        leading: CustomSvgPicture.withoutColor(
                          imagePath: "assets/images/logout.svg",
                        ),
                        trailing: CustomSvgPicture(
                          imagePath: "assets/images/right_arrow.svg",
                        ),
                      ),
                    ],
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
