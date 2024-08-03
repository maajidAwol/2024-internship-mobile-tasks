import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/models/products.dart';
import 'package:task6/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Widget> allCards = List.generate(10, (index) {
    //   return ItemCard();
    // });

    List<Product> products = ProductData.getAllData();

    List<Widget> allCards = products.map((Product) {
      return ItemCard(product: Product);
    }).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.grey,
                  // ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 204, 204, 204),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "July 14,2023",
                        style: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170),
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Hello ,",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Yohannes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(Icons.notifications_none),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(1),
                        minimumSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        side:
                            BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
                        backgroundColor: Colors.white),
                  )
                  // ButtonIcon(icon: Icons.notifications_none_outlined,background: Colors.white,color: Colors.black,)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // product section
        
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Available Products",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        // IconButton(
                        // onPressed: () {
                        //   Navigator.pushNamed(context, '/searchpage');
                        // },
                        //   icon: Icon(
        
                        //       Icons.search,
                        //       size: 30,
        
                        //   ),
                        // )
                        // SizedBox(
                        //   height: 50,
                        //   width: 50,
        
                        // )
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/searchpage');
                          },
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(2),
                              minimumSize: Size(40, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 217, 217, 217)),
                              backgroundColor: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //cardsl
                    Expanded(
                      // child: ListView.builder(
                      //   itemCount: 10,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return ItemCard();
                      //   },
                      // ),


                      child: Consumer<ProductData>(
      builder: (context, cart, child) {
        return ListView(
                        children: allCards,
                      );
      },
    ),
                    )
                  ],
                ),
              )
            ],
          ),

        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, '/additem');
              },
              child: Icon(
                Icons.add,color: Colors.white,
                size: 36,
              ),
              shape: CircleBorder(),
              
            );
          }
        ),
      ),
    );
  }
}
