import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Container(
                    // clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Image.asset(
                      "assets/shoes2.jpeg",
                      // height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 5),

                      height: 40,
                      width: 40,
                      // padding: EdgeInsets.only(left: ),
                      // height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          )),
                      child: GoBack(),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange.shade300,
                            ),
                            Text(
                              "(4.0)",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    ///
                    ///
                    Row(
                      children: [
                        Text(
                          "Derby Leather",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        Text(
                          "\$120",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          // _sizeCard(0),
                          Container(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (BuildContext, int index) {
                                return GestureDetector(
                                  child: _sizeCard(index + 39),
                                );
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
                      "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        // OutlinedButton(
                        //   onPressed: () {},
                        //   child: Text("DELETE"),
                        // ),
                        // Spacer(),
                        // ElevatedButton(onPressed: (){

                        // }, child: Text("UPDATE"))
                        Expanded(
                          child: DeleteButton(title: "DELETE"),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: BackgroundButton(title: "UPDATE"),
                        )
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
    return SizeCard(size: size);
  }
}

class SizeCard extends StatefulWidget {
  SizeCard({super.key, required this.size});
  int size;

  @override
  State<SizeCard> createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  Color active = Colors.blue;
  Color main = Colors.white;
  Color color = Colors.white;
  Color text = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (color == main) {
            color = active;
            text = Colors.white;
          } else {
            color = main;
            text = Colors.black;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(3),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                // spreadRadius: 1,
                blurRadius: 0.5,
                offset: Offset(0, 0.5))
          ],

          // boxShadow: ,
        ),
        child: Center(
          child: Text(
            "${widget.size}",
            style: TextStyle(
                color: text, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
