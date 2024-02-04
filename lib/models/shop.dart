import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List _foodMenu = [
    //salomon sushi
    Food(
        name: "Salmon Sushi",
        price: "23.00",
        imagePath: "assets/images/salmon_sushi.png",
        rating: "4.9"),

    //tuna
    Food(
        name: "Tuna",
        price: "25.00",
        imagePath: "assets/images/tuna.png",
        rating: "4.3"),

    Food(
        name: "Salmon Eggs",
        price: "20.00",
        imagePath: "assets/images/salmon_eggs.png",
        rating: "4.3"),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter methods
  List get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
