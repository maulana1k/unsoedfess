import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/main_screen/main_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/cover.png"), fit: BoxFit.cover)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, right: 30, left: 30),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 0,
                            spreadRadius: 2,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Sign In",
                          style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800)
                              .copyWith(fontSize: 32)),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.all(Radius.circular(40))),
                        child: const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontWeight: FontWeight.normal),
                                    hintText: "Username or email",
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.all(Radius.circular(40))),
                        child: const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontWeight: FontWeight.normal),
                                    hintText: "Password",
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const MainScreen()));
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.black)),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: Colors.grey.shade300)), // Change the border color to grey
                              overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
                              backgroundColor: const MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 22, child: Image.asset('assets/images/google-logo.png')),
                              const SizedBox(width: 10),
                              const Text(
                                "Continue With Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                              onTap: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.grey)),
                                  Text("Sign Up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
