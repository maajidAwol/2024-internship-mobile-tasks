import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image.asset('assets/smile.png', fit: BoxFit.cover,),)
      
              ,
              Opacity(
                opacity: 0.9,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(125, 63, 81, 243),
                        Color.fromARGB(255, 63, 81, 243,),
                      ],
                    ),
                  ),
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
              )
              ,
              
              Center(
                child: Positioned(
                  
                  
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 264,
                            
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('ECOM', style: TextStyle(color: Colors.blue, fontSize: 45, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Container(
                          child: Text('ECOMMERCE APP', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
              )
          ],
        ),
      ),
    );
  }
}