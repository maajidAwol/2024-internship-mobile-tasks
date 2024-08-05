import 'dart:io';

import 'package:flutter/material.dart';

class Product {
  Product(
      {required this.name,
      required this.description,
      this.id = 4,
      required this.price,
      required this.rating,
      required this.Image,
      required this.category,
      required this.image2,
      this.uploaded_image
      
      
      });

  int id;
  String name;
  String description;
  double price;
  double rating;
  String Image;
  String category;
  String image2;
  File ? uploaded_image;
}

class ProductData extends ChangeNotifier {
  static int id = 4;
  static double rating = 4.5;
  static String image2 = "assets/shoes2.jpeg";
  static List<Product> allProduct = [
    Product(
        name: "Derby Leather Shoes1",
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        id: 0,
        price: 35,
        rating: 4.1,
        Image: "assets/shoes.png",
        category: "men's shoes2",
        image2: "assets/shoes2.jpeg"),
    Product(
        name: "Derby Leather Shoes2",
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        id: 1,
        price: 35,
        rating: 4.1,
        Image: "assets/shoes.png",
        category: "men's shoes3",
        image2: "assets/shoes2.jpeg"),
    Product(
        name: "Derby Leather Shoes3",
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        id: 2,
        price: 35,
        rating: 4.1,
        Image: "assets/shoes.png",
        category: "men's shoes",
        image2: "assets/shoes2.jpeg"),
    Product(
        name: "Derby Leather Shoes4",
        description:
            "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
        id: 3,
        price: 35,
        rating: 4.1,
        Image: "assets/shoes.png",
        category: "men's shoes",
        image2: "assets/shoes2.jpeg"),
  ];

  static List<Product> getAllData() {
    return allProduct;
    
  }

  static void addProduct(Product product) {
    // product.id = id;
    id++;
    allProduct.add(product);
  }
}
