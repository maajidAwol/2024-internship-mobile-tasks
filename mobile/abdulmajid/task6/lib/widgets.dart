import 'package:flutter/material.dart';
class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () => {Navigator.pushNamed(context, '/detail')},
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                "assets/shoes.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Derby Leather Shoes",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$120",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Men's shoes",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange.shade300,
                          ),
                          Text("(4.0)",  style: TextStyle(fontWeight: FontWeight.w200),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundButton extends StatelessWidget {
   BackgroundButton({ required this.title,
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () {},
        child: Text(title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
class DeleteButton extends StatelessWidget {
   DeleteButton({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: Colors.red)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () {},
        child: Text("DELETE",
        style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
