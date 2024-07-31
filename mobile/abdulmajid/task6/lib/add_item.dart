import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
                height: 160,
                width: double.infinity,
                child: const Column(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 100,
                    ),
                    Text("Upload Image")
                  ],
                ),
              ),
              _textField("Name"),
              const SizedBox(
                height: 10,
              ),
              _textField("category"),
              const SizedBox(
                height: 10,
              ),
              _textField("Price"),
              const SizedBox(
                height: 10,
              ),
              _textField("description", 5),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(Colors.blue),

              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)
              //         )
              //       ),

              //     ),
              //     onPressed: () {},
              //     child: Text("ADD"),
              //   ),
              // ),
              BackgroundButton(title: "ADD"),
              DeleteButton(title: "REMOVE"),
            ],
          ),
        ),
      ),
    );
  }

  static _textField(String title, [int lines = 1]) {
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

