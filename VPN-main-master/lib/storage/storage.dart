import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../model/ikev2.dart';


class LocalStorage {
  Future<String> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ikev2List') ?? '';
  }
  Future<void> setHistory(List<ikev2> ikev2List) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ikev2List',jsonEncode(ikev2List));
  }
  Future<void> removeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('ikev2List');
  }
}
