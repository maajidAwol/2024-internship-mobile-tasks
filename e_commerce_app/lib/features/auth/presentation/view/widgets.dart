import 'package:flutter/material.dart';
class BackgroundButton extends StatelessWidget {
  BackgroundButton({required this.title, super.key, this.callback});
  String title;

  final VoidCallback? callback;

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
        onPressed: callback,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
    );
  }
}





class TextFieldTitle extends StatelessWidget {
  TextFieldTitle(
      {super.key,
      this.title = '',
      
      this.pass = false,
      
      this.hint = null,

      required this.controller});

 
  String title;
  String? hint;

  bool pass;
  
  TextEditingController controller;

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
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
          
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color.fromARGB(255,250, 250, 250),
            ),
            child: TextField(
              obscureText: pass,
              
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                
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
