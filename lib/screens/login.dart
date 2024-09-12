// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:e_commerce/widgets/my_button.dart';
import 'package:e_commerce/widgets/my_text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, this.onTap});
  static String id = "LoginPage";
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "user-not-found") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Error",
          desc: "No user found for this email",
        ).show();
      } else if (e.code == "wrong-password") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Error",
          desc: "Wrong Password",
        ).show();
      } else if (e.code == "email-already-in-use") {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Error",
          desc: "email elrady in use",
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: "Error",
          desc: "Please Enter your valid E-mail ",
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 72,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "S H O P P Y",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                const SizedBox(
                  height: 40,
                ),
                MyTextFiled(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextFiled(
                  controller: passController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (emailController.text == "") {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: "Error",
                            desc: "Please Enter your email to send Reset Link",
                          ).show();
                          return;
                        }
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text);
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.rightSlide,
                            title: "Attention",
                            desc:
                                "ResetPassword Sent , Please check your E-mail",
                          ).show();
                        } catch (e) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: "Error",
                            desc: "Please Enter your valid E-mail",
                          ).show();
                        }
                      },
                      child: Text(
                        "Forge't Password ?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue[400],
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  btnName: "Login",
                  onTap: () => signIn(),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont't have an account ? ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now ! ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue[300]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
