import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> allCards = List.generate(10, (index) {
      return ItemCard();
    });
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("July 14,2023",style: TextStyle(fontWeight: FontWeight.w200)),
                    Row(
                      children: [
                        Text(
                          "Hello ,",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Yohannes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Icon( Icons.notifications_none_outlined),
               
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/searchpage');
                        },
                        icon: Icon(
                          
                            Icons.search,
                            size: 30,
                        
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //cardsl
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
