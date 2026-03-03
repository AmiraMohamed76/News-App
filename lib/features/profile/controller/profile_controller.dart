import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:news_app/core/mixins/safe_notify_mixin.dart';

class ProfileController extends ChangeNotifier with SafeNotify{
  XFile? selectedImage;
  void pickImage(ImageSource source) async{
    selectedImage = await ImagePicker().pickImage(source: source);

    if(selectedImage == null) return;

    safeNotify();
  }
}