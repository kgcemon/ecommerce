import 'package:flutter/cupertino.dart';

class home_provider extends ChangeNotifier {
  home_provider() {
    addall();
  }

  int selectedindex = 0;

  final List<Map<String, dynamic>> brands = [
    {
      "name": "Nike 25DF",
      "price": 99.99,
      "image": "https://pngimg.com/d/running_shoes_PNG5800.png"
    },
    {
      "name": "Adidas 784FD",
      "price": 79.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5819.png"
    },
    {
      "name": "Puma KD78",
      "price": 69.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5825.png"
    },
    {
      "name": "Under Armour 754DD",
      "price": 89.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5785.png"
    },
    {
      "name": "Reebok RRDS20",
      "price": 59.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5780.png"
    },
    {
      "name": "New Balance WWSA",
      "price": 84.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5793.png"
    },
    {
      "name": "Converse OPP",
      "price": 49.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5794.png"
    },
    {
      "name": "Vans OOXOP",
      "price": 54.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5795.png"
    },
    {
      "name": "Timberland X548",
      "price": 129.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5797.png"
    },
    {
      "name": "Dr. Martens M85845",
      "price": 109.99,
      "image":
          "https://pngimg.com/uploads/running_shoes/running_shoes_PNG5799.png"
    }
  ];

  List<Map<String, dynamic>> filteredBrands = [];

  Cagorychange(int index) {
    selectedindex = index;
    notifyListeners();
  }

  addall() {
    filteredBrands.addAll(brands);
    notifyListeners();
  }

  void filterBrands(String query) {
    filteredBrands = brands
        .where((brand) =>
            brand["name"].toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  String mainvalue = "";
  detailspagesize(Value){
    mainvalue = Value;
    print(mainvalue);
    notifyListeners();
  }

}
