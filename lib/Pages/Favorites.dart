import 'package:ecommerce/Provider/Favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Favorites_Provider>(context).Favorites;
    return Scaffold(
      bottomNavigationBar: data.isNotEmpty
          ? Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60,
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF650E)),
                    onPressed: () {},
                    child: Text(
                      "Buy Now ${Provider.of<Favorites_Provider>(context, listen: false).total.toStringAsFixed(2)} ",
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
            )
          : Container(),
      appBar: AppBar(title: const Text("Favorites"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          data.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(data);
                      },
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          trailing: InkWell(
                              onTap: () {
                                Provider.of<Favorites_Provider>(context,
                                        listen: false)
                                    .removeFavorites(index,
                                        double.parse(data[index]['price']));
                              },
                              child: const Icon(Icons.delete,
                                  color: Colors.redAccent)),
                          title: Text(
                            data[index]['name'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('\$${data[index]['price']}'),
                          leading: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(data[index]['img'])),
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text("No Product Added Favorite"))
        ]),
      ),
    );
  }
}
