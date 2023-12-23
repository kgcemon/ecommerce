import 'package:flutter/foundation.dart';

class Favorites_Provider extends ChangeNotifier {


  List Favorites = [];

  double total = 0.0;

  addFavorites(String name, String img, String price){
    Favorites.add({"name": "$name", "img": "$img", "price": "$price"},);
    if (kDebugMode) {
      print(Favorites);
    }
    totalcount(double.parse(price));
    notifyListeners();
  }



  removeFavorites(int index, double price){
    Favorites.removeAt(index);
    var result = total-price;
    total = result;
    notifyListeners();
  }



  totalcount(double price){
   total +=price;
    notifyListeners();
  }



}