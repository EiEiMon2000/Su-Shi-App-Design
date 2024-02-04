import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/models/shop.dart';
import 'package:sushi_restaurant_app/pages/food_details.dart';
import 'package:sushi_restaurant_app/theme/color.dart';

import '../components/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //navigate to food item deals page
  void navigateToFoodDetails(int index) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
                food: foodMenu[index],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
        title: Center(
          child: Text(
            'Tokyo',
          ),
        ),
        actions: [
          //cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //promo banner
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(horizontal: 25),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //promo message
                Text(
                  "Get 32% Promo",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),

                //redeem button
                MyButton(text: "Redeem", onTap: () {}),
              ],
            ),

            //image
            Image.asset(
              'assets/images/many_sushi.png',
              height: 85,
            ),
          ]),
        ),
        SizedBox(
          height: 20,
        ),

        //search bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Search here...",
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),

        //menu list
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Food Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 7,
        ),

        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetails(index),
            ),
          ),
        ),

        //popular food
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(
            left: 25,
            right: 25,
            top: 5,
            bottom: 5,
          ),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //image
                  Image.asset(
                    'assets/images/salmon_eggs.png',
                    height: 40,
                  ),

                  SizedBox(
                    width: 3,
                  ),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name
                      Text(
                        "Salmon Eggs",
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                      ),
                      Text(
                        "\$21.00",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //heart
              Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 28,
              )
            ],
          ),
        )
      ]),
    );
  }
}
