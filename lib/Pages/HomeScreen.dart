import 'package:ecommerce/Pages/Favorites.dart';
import 'package:ecommerce/Provider/home_provider.dart';
import 'package:ecommerce/widget/Appbar.dart';
import 'package:ecommerce/widget/SearchBox.dart';
import 'package:ecommerce/widget/mainProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          if(value ==2){
           Navigator.push(context, MaterialPageRoute(builder: (context) => Favorites(),));
          }
        },
        elevation: 0,
        backgroundColor: Colors.transparent,
        fixedColor: Colors.redAccent,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          toolbarHeight: 30),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const MyAppBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const SearchBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      CataList(),
                      mainproduct(),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CataList extends StatelessWidget {
  CataList({super.key});

  List catagorys = [
    {"name": "All"},
    {"name": "Nike"},
    {"name": "Adidas"},
    {"name": "Puma"},
    {"name": "Under Armour"},
    {"name": "Reebok"},
    {"name": "New Balance"},
    {"name": "Converse"},
    {"name": "Vans"},
    {"name": "Timberland"},
    {"name": "Dr. Martens"}
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: catagorys.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var allcata = Provider.of<home_provider>(context);
          return InkWell(
            onTap: () {
              allcata.Cagorychange(index);
              catagorys[index]['name'] != 'All'
                  ? allcata.filterBrands(catagorys[index]['name'])
                  : allcata.Cagorychange(index);
              catagorys[index]['name'] == 'All'
                  ? allcata.filteredBrands = allcata.brands
                  : allcata.Cagorychange(index);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(right: 14),
              height: 20,
              width: 75,
              decoration: BoxDecoration(
                  color: index == allcata.selectedindex
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              child: FittedBox(
                  child: Text(
                catagorys[index]['name'],
                style: TextStyle(
                    color: index == allcata.selectedindex
                        ? Colors.white
                        : Colors.black),
              )),
            ),
          );
        },
      ),
    );
  }
}
