import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task6/models/products.dart';
import 'package:task6/widgets.dart';
import 'dart:io';

class AddItem extends StatefulWidget {
  AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController name_controller = TextEditingController();

  TextEditingController category_controller = TextEditingController();

  TextEditingController description_controller = TextEditingController();

  TextEditingController price_controller = TextEditingController();

  File? selectedImage;

  //
  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    void addProduct() {
       
      print(name_controller.text);
      print(category_controller.text);

      Product newProduct = Product(
          id: ProductData.id,
          uploaded_image: selectedImage,
          image2:  "assets/shoes2.jpeg",
          rating: ProductData.rating,
          name: name_controller.text,
          description: description_controller.text,
          price: double.parse(price_controller.text),
          Image: "assets/shoes.png",
          category: category_controller.text);
      ProductData.addProduct(newProduct);
      Navigator.pushNamed(context, '/home');
    }

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
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  height: 190,
                  width: double.infinity,
                  child: selectedImage != null
                      ? Image.file(
                          fit: BoxFit.cover,
                          selectedImage!,
                        )
                      : Column(
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
              ),
              SizedBox(
                height: 10,
              ),

              TextFieldTitle(
                title: "name",
                controller: name_controller,
              ),
              const SizedBox(
                height: 10,
              ),

              TextFieldTitle(
                title: "category",
                controller: category_controller,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldTitle(
                title: "price",
                type: Icons.attach_money,
                controller: price_controller,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldTitle(
                title: "description",
                lines: 5,
                controller: description_controller,
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
              BackgroundButton(
                title: "ADD",
                callback: addProduct,
              ),
              DeleteButton(title: "REMOVE"),
            ],
          ),
        ),
      ),
    );
  }
}
