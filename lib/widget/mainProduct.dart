import 'package:ecommerce/Pages/details_Page.dart';
import 'package:ecommerce/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainproduct extends StatelessWidget {
  const mainproduct({super.key});

  @override
  Widget build(BuildContext context) {
    List allshows = Provider.of<home_provider>(context).filteredBrands;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allshows.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 5,
          mainAxisExtent: 300),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => details_Pages(
                img: allshows[index]['image'], Price: allshows[index]['price'].toString(),
                Pname: allshows[index]['name']),));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 210,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffD3D3D3)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Hero(
                    transitionOnUserGestures: true,
                      tag: allshows[index]['name'],
                  child: Image.network(allshows[index]['image'])),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text("${allshows[index]['name']}"),
              Text('\$${allshows[index]['price']}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}
