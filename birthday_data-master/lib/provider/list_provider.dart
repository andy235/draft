import 'package:flutter/material.dart';

class ListProvider with ChangeNotifier {

  List listOfCardsProvider = ['init', 'init', 'init'];


  void addToListModel(String name, String data, String pathPhoto) {
    listOfCardsProvider.add(name);
    listOfCardsProvider.add(data);
    listOfCardsProvider.add(pathPhoto);
    notifyListeners();
  }
}