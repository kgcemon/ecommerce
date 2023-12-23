import 'package:ecommerce/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});



  @override
  Widget build(BuildContext context) {
    var searchbd = Provider.of<home_provider>(context);
    return Row(
      children: [
         Expanded(
            flex: 14,
            child: SearchBar(
              onChanged: searchbd.filterBrands,
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              hintText: 'Search',
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
              side: const MaterialStatePropertyAll(
                  BorderSide(color: Colors.black12)),
              elevation: const MaterialStatePropertyAll(0),
            )),
        const Expanded(
            child: SizedBox(
              width: 0.1,
            )),
        Expanded(
          flex: 3,
          child: Container(
            height: 55,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.search,size: 30, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
