import 'package:flutter/material.dart';
import 'package:task6/models/products.dart';
import 'package:task6/widgets.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = ProductData.getAllData();
    TextEditingController search_controller = TextEditingController();
    TextEditingController category_controller = TextEditingController();

    List<Widget> allCards = products.map((Product) {
      return ItemCard(product: Product);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GoBack(),
        title: Text(
          "Search Product",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFieldTitle(
                    hint: "Leather",
                    border: true,
                    type: Icons.arrow_forward,
                    typecolor: Color.fromARGB(255, 63, 81, 243),
                    color: Colors.white,
                    controller: search_controller,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                            ButtonIcon(
                              buildcontext: context,
                              callback: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){

                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: FilterBottom(category_controller: category_controller));
                    });

                },
                              icon: Icons.filter_list,
                            )

                // IconButton(
                //   style: ButtonStyle(
                //     // side: MaterialStateBorderSide,
                //     backgroundColor: MaterialStateProperty.all(Colors.blue),
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(7),
                //       ),
                //     ),
                //   ),
                //   onPressed: () {
                //     showModalBottomSheet(
                //         context: context,
                //         builder: (BuildContext context) {
                //           return SizedBox(
                //             height: 200,
                //             child: Text("hello"),
                //           );
                //         }
                //         );
                //   },
                //   icon: Icon(Icons.filter_list, color: Colors.white),
                // )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // card
            Expanded(
              child: SizedBox(
                height: 100,
                // child: ListView.builder(
                //   itemCount: 10,
                //   itemBuilder: (context, int index) {
                //     return ItemCard();
                //   },
                // ),
                child: ListView(
                  children: allCards,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),


            
          ],
        ),
      ),
    );
  }

  static _textField1(String title, [int lines = 1]) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color.fromARGB(255, 246, 241, 241),
            ),
            child: TextField(
              maxLines: lines,
              decoration: InputDecoration(
                border: InputBorder.none,
                // suffixIcon: Icon(Icons.pedal_bike),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBottom extends StatelessWidget {
  const FilterBottom({
    super.key,
    required this.category_controller,
  });

  final TextEditingController category_controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      // height: 200,
      children: [
        TextFieldTitle(
                    controller: category_controller,
                    title: "Category",
                    color: Colors.white,
                    border: true,
                    fontsize: 16),
    
                // ItemCard()
                SizedBox(height: 15),
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
    
                RangeSlider(
                  activeColor: Colors.blue,
                  values: RangeValues(2, 9),
                  max: 10,
                  min: 1,
                  onChanged: (RangeValues newValue) {},
                ),
                SizedBox(
                  height: 25,
                ),
                BackgroundButton(
                  title: "APPLY",
                ),
      ],
    );
  }
}
