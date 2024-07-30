import 'package:codelabs/models/product.dart';
import 'package:codelabs/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SHRINE"),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              semanticLabel: "Menu",
            ),
            onPressed: () {
              debugPrint("Menu clicked");
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: "Search",
              ),
              onPressed: () {
                debugPrint("Search Clicked");
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.tune,
                semanticLabel: "Tune",
              ),
              onPressed: () {
                debugPrint("Tune Clicked");
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8 / 9,
          children: _buildGridCards(context),
        ),
      ),
    );
  }
}

List<Card> _buildGridCards(BuildContext context) {
  List<Product> products = ProductRepository.loadProducts();

  //  if (products.isEmpty) {
  //   return const <Card>[];
  // }
  // final NumberFormat formatter = NumberFormat.simpleCurrency(
  //     locale: Localizations.localeOf(context)!.toString());

  return products.map((product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            
            aspectRatio: 18.0 / 11.0,
          
            child: Image.asset(
              fit: BoxFit.fitWidth,
              
              
              product.assetName,
              package: product.assetPackage,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                SizedBox(
                  height: 8,
                ),
                Text('\$${product.price}')
              ],
            ),
          )
        ],
      ),
    );
  }).toList();

  // List<Card> allCards = List.generate(
  //   count,
  //   (index) {
  //     return Card(
  //       clipBehavior: Clip.antiAlias,
  //       child: Column(
  //         children: [
  //           AspectRatio(
  //             aspectRatio: 18.0 / 11.0,
  //             child: Image.asset("assets/diamond.png"),
  //           ),
  //           const Padding(
  //             padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Title"),
  //                 SizedBox(
  //                   height: 8,
  //                 ),
  //                 Text("Secondary title")
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  //   },
  // );

  // return allCards;
}
