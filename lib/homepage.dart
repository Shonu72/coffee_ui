// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_ui/utills/coffee_tile.dart';
import 'package:coffee_ui/utills/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee type
  final List coffeeType = [
    // coffee type, isSelected
    ["Latte", false],
    ["Espresso", false],
    ["Cappuccino", true],
    ["Mocha", false],
    ["Black", false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: 'Cart',
              ),
            ]),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Let's find best coffee for you",
                style: GoogleFonts.bebasNeue(fontSize: 60, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //horizontal listview
            SizedBox(
              height: 40,
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeetype: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () => coffeeTypeSelected(index),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/one.jpg',
                    coffeename: 'Cappuccino',
                    coffeePrice: '₹ 299',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/two.jpg',
                    coffeename: 'Latte',
                    coffeePrice: '₹ 199',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/three.jpg',
                    coffeename: 'Mocha',
                    coffeePrice: '₹ 189',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/four.jpg',
                    coffeename: 'Espresso',
                    coffeePrice: '₹ 99',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
