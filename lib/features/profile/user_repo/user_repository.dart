import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/core/model/user_model.dart';

class UserRepository {
  UserRepository._internal();

  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() => _instance;

  Box<UserModel>? _userBox;

  Box<UserModel> get userBox {
    if (_userBox == null) {
      throw Exception("UserBox is not initialized");
    }
    return _userBox!;
  }

  init() async {
    print("init");
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    _userBox = await Hive.openBox<UserModel>(StorageKey.userBox);
  }

  saveUser(UserModel user) async {
    await userBox.put(StorageKey.currentUser, user);
  }

  getUser() => userBox.get(StorageKey.currentUser);

  updateUser({
    String? name,
    String? email,
    String? password,
    String? countryName,
    String? countryCode,
  }) async {
    final UserModel? user = getUser();

    if (user != null) {
      final updatedUser = user.copyWith(
        userName: name,
        userEmail: email,
        userPassword: password,
        countryName: countryName,
        countryCode: countryCode,
      );
      await saveUser(updatedUser);
    }
  }

  deleteUser() async {
    await userBox.delete(StorageKey.currentUser);
  }

  clearUserBox() async {
    await userBox.clear();
  }

  String? login(String userEmail, String userPassword) {
    final user = getUser();
    if (user == null) return "No Account found please register first";
    if (user.userEmail != userEmail || user.userPassword != userPassword) {
      return "Incorrect Email or Password";
    }
    return null;
  }

  Future<String?> register(String userName, String userEmail, String userPassword) async {
    final user = getUser();
    if (user != null) return "Account already exists please login";

    final newUser = UserModel(
      userName: userName,
      userEmail: userEmail,
      userPassword: userPassword,
    );
    await saveUser(newUser);
    return null;
  }
}
