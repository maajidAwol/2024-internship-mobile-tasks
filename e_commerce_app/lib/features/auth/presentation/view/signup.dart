import 'package:e_commerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    void signup(){
      
                  context.read<AuthBloc>().add(SignUpEvent(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text));
                  Navigator.pushNamed(context, '/login');
                
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 50,
              //   width: 50,
              //   color: Colors.black,
              // ),

              Text(
                "Create your account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              // Text("Name"),
              // TextField(
              //   controller: nameController,
              // ),
              TextFieldTitle(title: "Name",controller: nameController,hint: "joen",),
              // Text("Email"),
              // TextField(
              //   controller: emailController,
              // ),,
              TextFieldTitle(controller: emailController,title: "Email",)
              ,
              // Text("Password"),
              // TextField(
              //   controller: passwordController,
              // ),


              TextFieldTitle(controller: passwordController,pass: true,title: "Password",),
              TextFieldTitle(controller: confirmPassController,pass: true,title: "Confirm Password",),
              // Text("Confirm Password"),
              // TextField(
              //   controller: passwordController,
              // ),

              // ElevatedButton(
              //   onPressed: () {
              //     context.read<AuthBloc>().add(SignUpEvent(
              //         name: nameController.text,
              //         email: emailController.text,
              //         password: passwordController.text));
              //     Navigator.pushNamed(context, '/login');
              //   },
              //   child: Text("SIGN UP"),
              // ),
              BackgroundButton(title: "SIGN UP",callback: signup),
              // ElevatedButton(
              //   onPressed: () {
                
              //     Navigator.pushNamed(context, '/login');
              //   },
              //   child: Text("Login"),
              // ),
              BackgroundButton(title: "LOGIN",callback: (){
                Navigator.pushNamed(context, '/login');
              },)
            ],
          ),
        ),
      ),
    );
  }
}
