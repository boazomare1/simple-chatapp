// ignore_for_file: file_names, use_build_context_synchronously, unused_import

import 'package:bomamessenger/pages/services/auth/auth_service.dart';
import 'package:bomamessenger/utils/my_button.dart';
import 'package:bomamessenger/utils/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void signUp() async {
    //final authService = Provider.of(context, listen: false);
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not Match")));
      return;
    }
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
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
                  "Welcome, Let's Create an Account for you",
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
                MyTextField(
                    obscureText: true,
                    hintText: "Confirm Password",
                    controller: confirmpasswordController),
                //sigin button
                const SizedBox(
                  height: 25,
                ),
                MyButton(onTap: signUp, buttonText: "Sign Up"),
                //not a  member to register
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a Member"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
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
