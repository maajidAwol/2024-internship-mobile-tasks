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
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Derby Leather Shoes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$120",
                        style: TextStyle(
                          fontSize: 14,
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
                        style: TextStyle(
                          color: Color.fromARGB(255, 170, 170, 170),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 215, 0),
                            size: 20,
                          ),
                          Text(
                            "(4.0)",
                            style: TextStyle(
                              color: Color.fromARGB(255, 170, 170, 170),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          )
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
  BackgroundButton({
    required this.title,
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
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
        ),
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
          side: MaterialStateProperty.all(
            BorderSide(
              color: Color.fromRGBO(190, 19, 19, 1),
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () {},
        child: Text(
          "DELETE",
          style: TextStyle(
              color: Color.fromRGBO(190, 19, 19, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  ButtonIcon({super.key, required this.icon, this.color = Colors.white,this.background =Colors.blue,this.border = false});
  IconData icon;
  Color color;
  Color background;
  bool border;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.white,
      style: ButtonStyle(
          // side: MaterialStateBorderSide,
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))),
    );
  }
}

class GoBack extends StatelessWidget {
  const GoBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 18,
        color: Color.fromARGB(255, 63, 81, 243),
      ),
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  TextFieldTitle(
      {super.key,
      this.fontsize = 14,
      this.title = '',
      this.border = false,
      this.lines = 1,
      this.type = null,
      this.typecolor = Colors.black,
      this.hint = null,
      this.color = const Color.fromARGB(255, 243, 243, 243)});

  int lines = 1;
  IconData? type;
  String title;
  String? hint;
  Color color;
  bool border;
  double fontsize;
  Color typecolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != ''
              ? Text(
                  title,
                  style: TextStyle(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 217, 217, 217),
                width: border ? 1 : 0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: color,
            ),
            child: TextField(
              maxLines: lines,
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(type,color: typecolor,),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.only(left: 16, top: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
