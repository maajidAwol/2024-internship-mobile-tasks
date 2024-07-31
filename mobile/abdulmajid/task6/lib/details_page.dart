import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/shoes.png",
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      // padding: EdgeInsets.only(left: ),
                      // height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          )),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Men's shoes",
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade300,
                            ),
                            Text("(4.0)")
                          ],
                        )
                      ],
                    ),

                    ///
                    ///
                    Row(
                      children: [
                        Text(
                          "Derby Leather Shoes",
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$120",
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size:",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          // _sizeCard(0),
                          Container(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (BuildContext, int index) {
                                
                                return _sizeCard(index + 39);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."),
                    SizedBox(height: 30,)
                    ,Row(
                      children: [
                        // OutlinedButton(
                        //   onPressed: () {},
                        //   child: Text("DELETE"),
                        // ),
                        // Spacer(),
                        // ElevatedButton(onPressed: (){

                        // }, child: Text("UPDATE"))
                        Expanded(child: DeleteButton(title: "DELETE"),),
                        SizedBox(width: 50,),
                        Expanded(child: BackgroundButton(title: "UPDATE"),)

                      
                      
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sizeCard(int size) {
    return Container(
      margin: EdgeInsets.all(3),
      
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade50,
        
        
        // boxShadow: ,
      ),
      child: Center(
        child: Text(
          "$size",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
