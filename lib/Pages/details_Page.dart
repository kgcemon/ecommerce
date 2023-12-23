import 'package:ecommerce/Pages/Favorites.dart';
import 'package:ecommerce/Provider/Favorites_provider.dart';
import 'package:ecommerce/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class details_Pages extends StatelessWidget {
  String Pname;
  String Price;
  String img;

  details_Pages(
      {super.key, required this.img, required this.Price, required this.Pname});

  var mycolor = [
    {"name": "Item 1", "color": "0xffFF5733"},
    {"name": "Item 2", "color": "0xff3498DB"},
    {"name": "Item 3", "color": "0xff27AE60"},
    {"name": "Item 4", "color": "0xff8E44AD"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                var cartlist = Provider.of<Favorites_Provider>(context,listen: false).Favorites;
                if(cartlist.toString().contains(Pname)){
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: const Text("this product already Added to Favorite "),
                    action: SnackBarAction(label: 'View', onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Favorites(),)),),
                  ));
                }else{
                  Provider.of<Favorites_Provider>(context, listen: false)
                      .addFavorites(Pname, img, Price);
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: const Text("Added to Favorite "),
                    action: SnackBarAction(label: 'View', onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favorites(),)),),
                  ));

                }



              },
              child: (Image.asset(
                'images/love.png',
                height: 35,
              )),
            ),
            const SizedBox(
              width: 15,
            )
          ],
          elevation: 0,
          surfaceTintColor: const Color(0xffddd5d5),
          backgroundColor: const Color(0xffDDD5D5)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(color: Color(0xffDDD5D5)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Hero(
                  tag: Pname,
                  child: Image.network(img),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Pname,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "\$$Price",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffF29D38),
                        ),
                        Text(
                          "4.5 (15 Review)",
                          style: TextStyle(
                            color: Color(0xffF29D38),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const Text('Nike Dri-Fit is a polyester '
                        ' fabric designed to help you '
                        'keep dry so you can more comfortably work harder, longer. '),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Color: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Container(
                      margin: const EdgeInsets.only(right: 120),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mycolor.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 35),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(
                                        int.parse(mycolor[index]['color']!)),
                                    borderRadius: BorderRadius.circular(10))),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Size:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffAFADAD)),
                      ),
                      child: DropdownButton<String>(
                        value: Provider.of<home_provider>(context)
                                .mainvalue
                                .isEmpty
                            ? "Choose Size"
                            : Provider.of<home_provider>(context).mainvalue,
                        items: const [
                          DropdownMenuItem(
                            value: 'Choose Size',
                            child: Text(
                              'Choose Size',
                              style: TextStyle(color: Color(0xffAFADAD)),
                            ),
                          ),
                          DropdownMenuItem(
                            value: '50',
                            child: Text(
                              '50',
                              style: TextStyle(color: Color(0xffAFADAD)),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'a',
                            child: Text(
                              'a',
                              style: TextStyle(color: Color(0xffAFADAD)),
                            ),
                          ),
                          // Add more DropdownMenuItem items as needed
                        ],
                        onChanged: (value) {
                          Provider.of<home_provider>(context, listen: false)
                              .detailspagesize(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFF650E)),
                            onPressed: () {},
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
