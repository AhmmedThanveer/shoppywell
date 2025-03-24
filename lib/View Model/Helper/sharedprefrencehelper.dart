import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencehelper {
  //SETTING VARIABLES
  Future<bool> setFirebaseAuthToken(String firebasetoken) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(UserPref.firebaseAuthToken.toString(), firebasetoken);
  }

  Future<bool> setLaravelAuthToken(String laraveltoken) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(UserPref.laravelAuthToken.toString(), laraveltoken);
  }

  // Future<bool> setName(String name) async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.setString(UserPref.name.toString(), name);
  // }

  // Future<bool> setEmailId(String emailId) async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.setString(UserPref.emailId.toString(), emailId);
  // }

  // Future<bool> setPassword(String password) async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.setString(UserPref.password.toString(), password);
  // }

//GETING VARIABLES
  Future<String?> getFireBaseAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.firebaseAuthToken.toString());
  }

  Future<String?> getLaravelAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.laravelAuthToken.toString());
  }

  Future<String?> getName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.name.toString());
  }

  Future<String?> getEmailIDname() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.emailId.toString());
  }

  Future<String?> getPassword() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(UserPref.password.toString());
  }

  Future<void> clearTokens() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(UserPref.firebaseAuthToken.toString());
    await pref.remove(UserPref.laravelAuthToken.toString());
  }

  // Future<void> saveTokenLoginToken(String token) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('token', token);
  // }

  // Future<String?> getLoginAuthToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }
}

enum UserPref {
  firebaseAuthToken,
  laravelAuthToken,
  name,
  emailId,
  password,
}
