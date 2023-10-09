import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bxl.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome 👋",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                            hintText: "Username or email",
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                            hintText: "Password",
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            enabledBorder: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(child: Divider(endIndent: 10.0, color: Colors.grey.shade200)),
                        const Text("Or continue with", style: TextStyle(fontSize: 12)),
                        Expanded(child: Divider(indent: 10.0, color: Colors.grey.shade200)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: const BorderRadius.all(Radius.circular(12))),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Iconify(Bxl.google),
                                  SizedBox(width: 10),
                                  Text(
                                    "Google",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: const BorderRadius.all(Radius.circular(12))),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Iconify(Bxl.facebook),
                                  SizedBox(width: 10),
                                  Text(
                                    "Facebook",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "Create Account",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
