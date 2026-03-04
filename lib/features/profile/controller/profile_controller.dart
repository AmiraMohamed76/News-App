import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/data_source/local_data/preferences_manager.dart';
import 'package:news_app/core/mixins/safe_notify_mixin.dart';

class ProfileController extends ChangeNotifier with SafeNotify{
  XFile? selectedImage;
  String? userName;
  String? countryName;
  String? countryCode;
  void pickImage(ImageSource source) async{
    selectedImage = await ImagePicker().pickImage(source: source);

    if(selectedImage == null) return;

    safeNotify();
  }

  void getUserData(){
    userName = PreferencesManager().getString(StorageKey.userName) ?? "";
    countryName = PreferencesManager().getString(StorageKey.countryName);
    countryCode = PreferencesManager().getString(StorageKey.countryCode);
    safeNotify();
  }

  void saveSelectedCountry(Country selectedCountry) async{
    await PreferencesManager().setString(StorageKey.countryName, selectedCountry.name);
    await PreferencesManager().setString(StorageKey.countryCode, selectedCountry.countryCode);

    countryName = selectedCountry.name;
    countryCode = selectedCountry.countryCode;

    safeNotify();
  }
}