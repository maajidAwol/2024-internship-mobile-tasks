import 'dart:io';

void main() {
  print("object");
  ProductManager manager = ProductManager();
  String? choice = "";
  while (choice != '6') {
    print("================E-Commerce Class Practice============");
    print("Choose Action");
    print("1: Add a new product");
    print("2: View all products");
    print("3: View a single product");
    print("4: Edit a product (update name, description, price)");
    print("5: Delete a product");
    print("6: Exit");

    choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        manager.addProduct();
      case '2':
        manager.viewAll();
      case '3':
        manager.viewOne();
      case '4':
        manager.edit();
      case '5':
        manager.delete();
      case '6':
        break;
    }
  }
}

class Product {
  String? Name;
  String? Description;
  double? Price;
  Product(String? Name, String? Description, double? Price) {
    this.Name = Name;
    this.Description = Description;
    this.Price = Price;
  }
}

class ProductManager {
  List<Product> AllProducts = [];

  void addProduct() {
    print("Enter Name: ");
    String? Name = stdin.readLineSync();
    print("Enter Description: ");
    String? Description = stdin.readLineSync();
    print("Enter Price: ");
    double Price = double.parse(stdin.readLineSync() ?? '0');

    Product NewProduct = Product(Name, Description, Price);
    AllProducts.add(NewProduct);
    // return NewProduct;
  }

  void viewAll() {
    if (AllProducts.length == 0) {
      print("NO product Available");
    } else {
      var i = 0;
      for (var product in AllProducts) {
        print("======Product${i}========");
        print("Product Name: ${product.Name}");
        print("Product Description: ${product.Description}");
        print("Product Price: ${product.Price}");
        i++;
      }
    }
  }

  void viewOne() {
    if (AllProducts.length == 0) {
      print("NO product Available");
    } else {
      print("Enter Number of  Product You want to see");
      var i = 1;
      for (var product in AllProducts) {
        print("${i}: ${product.Name}");
        i++;
      }
      int idx = int.parse(stdin.readLineSync() ?? '0') - 1;

      print("Product Name: ${AllProducts[idx].Name}");
      print("Product Description: ${AllProducts[idx].Description}");
      print("Product Price: ${AllProducts[idx].Price}");
    }
  }

  void edit() {
    if (AllProducts.length == 0) {
      print("NO product Available");
    } else {
      print("Enter Number of  Product You want to edit");
      var i = 1;
      for (var product in AllProducts) {
        print("${i}: ${product.Name}");
        i++;
      }
      int idx = int.parse(stdin.readLineSync() ?? '0') - 1;
      print("Enter new Name(${AllProducts[idx].Name}): ");
      String? Name = stdin.readLineSync();
      print("Enter new  Description(${AllProducts[idx].Description}): ");
      String? Description = stdin.readLineSync();
      print("Enter new  Price(${AllProducts[idx].Price}): ");
      double Price = double.parse(stdin.readLineSync() ?? '0');
      AllProducts[idx].Name = Name;
      AllProducts[idx].Description = Description;
      AllProducts[idx].Price = Price;
    }
  }

  void delete() {
    if (AllProducts.length == 0) {
      print("NO product Available");
    } else {
      print("Enter Number of  Product You want to delete");
      var i = 1;
      for (var product in AllProducts) {
        print("${i}: ${product.Name}");
      }
      int idx = int.parse(stdin.readLineSync() ?? '0') - 1;
      AllProducts.removeAt(idx);
    }
  }
}
