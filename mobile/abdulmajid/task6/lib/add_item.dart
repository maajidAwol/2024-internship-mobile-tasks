import 'package:flutter/material.dart';
import 'package:task6/widgets.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GoBack(),
        backgroundColor: Colors.white,
        title: Text(
          "Add Product",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
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
                  color: Color.fromARGB(255, 243, 243, 243),
                ),
                height: 190,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 48,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "upload image",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFieldTitle(title: "name"),
              const SizedBox(
                height: 10,
              ),

              TextFieldTitle(title: "category"),
              const SizedBox(
                height: 10,
              ),
              TextFieldTitle(title: "price", type: Icons.attach_money),
              const SizedBox(
                height: 10,
              ),
              TextFieldTitle(
                title: "description",
                lines: 5,
              ),
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

  // static _textField(String title, [int lines = 1, IconData? type = null]) {
  //   return TextFieldTitle();
  // }
}

