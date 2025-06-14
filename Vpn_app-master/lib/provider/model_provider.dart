import 'package:flutter/material.dart';

class ModelCountry with ChangeNotifier {

  var countrySize = [16.0, 16.0, 16.0, 16.0, 16.0, 16.0, 16.0,];
  var selected = [false, false, false, false, false, false, false];
  var pathImage = [
    'assets/images/shadowCountries/canada-black.jpeg',
    'assets/images/shadowCountries/russia-black.jpeg',
    'assets/images/shadowCountries/japan-black.jpeg',
    'assets/images/shadowCountries/usa-black.jpeg',
    'assets/images/shadowCountries/uar-black.jpeg',
    'assets/images/shadowCountries/india-black.jpeg',
    'assets/images/shadowCountries/germany-black.jpeg',
  ];
  var colors = [
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
    Colors.transparent.withOpacity(0),
  ];
  var generalColor = Colors.green;
  var textConnect = ['Connected', 'Connecting', 'Connection failed'];

  switchColorInRichText(var switchColorItem) {
    generalColor = switchColorItem;
    if(selected[0] == true){
      colors[0] = generalColor;
    }else if(selected[1] == true) {
      colors[1] = generalColor;
    }else if(selected[2] == true) {
      colors[2] = generalColor;
    }else if(selected[3] == true) {
      colors[3] = generalColor;
    }else if(selected[4] == true) {
      colors[4] = generalColor;
    }else if(selected[5] == true) {
      colors[5] = generalColor;
    }else if(selected[6] == true) {
      colors[6] = generalColor;
    }
    notifyListeners();
  }

}