import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsoedfess/features/auth/new_profile.dart';
import 'package:unsoedfess/features/auth/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      // await Future.delayed(const Duration(seconds: 2));
      // UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // );
      // User? user = userCredential.user;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', 'sample');
      prefs.setString('email', 'sample@gmail.com');
      // print("User signed in: ${user?.uid}");
      setState(() {
        _isLoading = false;
      });

      if (context.mounted) {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => const NewProfile()));
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error signing in: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign in error"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 450,
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
                          color: Colors.black, blurRadius: 0, spreadRadius: 2, offset: Offset(0, 0))
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
                              color: Colors.grey.shade300, borderRadius: BorderRadius.circular(30)),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("Create Account",
                        style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800)
                            .copyWith(fontSize: 32)),
                    const SizedBox(height: 10),
                    CustomTextInput(hintText: 'Username', controller: _usernameController),
                    const SizedBox(height: 10),
                    CustomTextInput(hintText: 'Email', controller: _emailController),
                    const SizedBox(height: 10),
                    CustomTextInput(
                        hintText: 'Password', controller: _passwordController, obscureText: true),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : () => signInWithEmailAndPassword(context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(_isLoading ? Colors.grey : Colors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isLoading)
                              const SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2)),
                            const SizedBox(width: 15),
                            const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            side:
                                MaterialStateProperty.all(BorderSide(color: Colors.grey.shade300)),
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
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const SignIn()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                                Text("Sign In",
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
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  const CustomTextInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(40))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal),
                  hintText: hintText,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
