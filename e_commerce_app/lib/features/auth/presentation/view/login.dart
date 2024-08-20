import 'package:e_commerce_app/features/auth/presentation/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    void login() {
      context.read<AuthBloc>().add(LoginEvent(
          email: emailController.text, password: passwordController.text));

      Navigator.pushNamed(context, '/home');
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 50,
                width: 100,
                // color: Colors.black,
                child: Center(
                  child: Text(
                    "ECOM",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                "Create your account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              // Text("Email"),
              // TextField(
              //   controller: emailController,
              // ),
              TextFieldTitle(title: "Email", controller: emailController),
              TextFieldTitle(title: "Password", controller: emailController),
              // Text("Password"),
              // TextField(
              //   controller: passwordController,
              // ),

              // ElevatedButton(
              //   onPressed: () {
              //     context.read<AuthBloc>().add(LoginEvent(
              //         email: emailController.text,
              //         password: passwordController.text));

              //     Navigator.pushNamed(context, '/home');
              //   },
              //   child: Text("LOGIN"),
              // ),
              SizedBox(height: 20),

              BackgroundButton(
                title: "LOGIN",
                callback: login,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
