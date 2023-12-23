import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Hi Dhiraj!\nGood Morning",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Image.asset(
          "images/profile.png",
          height: 40,
        )
      ],
    );
  }
}
