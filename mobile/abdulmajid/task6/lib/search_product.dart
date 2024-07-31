import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leather"),
                        // Spacer(),
                        // SizedBox(width: 20,),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.filter_list)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // card
            Expanded(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    return ItemCard();
                  },
                ),
              ),
            ),
            _textField1("Category"),
            // ItemCard()

            Text(
              'Price',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            RangeSlider(
              values: RangeValues(2, 8),
              max: 10,
              min: 1,
              onChanged: (RangeValues newValue) {},
            ),

            BackgroundButton(title: "APPLY",),
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
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey,
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

