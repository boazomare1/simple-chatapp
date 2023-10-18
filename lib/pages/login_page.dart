// ignore_for_file: use_build_context_synchronously

import 'package:bomamessenger/pages/services/auth/auth_service.dart';
import 'package:bomamessenger/utils/my_button.dart';
import 'package:bomamessenger/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    //get the  auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
          )
          )
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Logo
                const Icon(
                  Icons.person_3_outlined,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                //welcome message
                const Text(
                  "Welcome, we missed you",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //email textField
                MyTextField(
                    obscureText: false,
                    hintText: "Email",
                    controller: emailController),
          
                const SizedBox(
                  height: 25,
                ),
          
                //password textField
                MyTextField(
                    obscureText: true,
                    hintText: "Password",
                    controller: passwordController),
                //sigin button
                const SizedBox(
                  height: 25,
                ),
                MyButton(onTap: signIn, buttonText: "Sign In"),
                //not a  member to register
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a Member"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
