import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/auth/create_profile.dart';
// import 'package:unsoedfess/features/auth/new_profile.dart';
import 'package:unsoedfess/features/auth/services/auth_service.dart';
import 'package:unsoedfess/features/auth/signin.dart';
import 'package:unsoedfess/provider/user_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late final _usernameCtrl = TextEditingController();
  late final _emailCtrl = TextEditingController();
  late final _passwordCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _startLoading() {
    setState(() => _isLoading = true);
  }

  void _stopLoading() {
    setState(() => _isLoading = false);
  }

  Future<void> _onSignUpPressed(BuildContext context) async {
    _startLoading();
    if (_formKey.currentState!.validate()) {
      try {
        final authService = AuthService();
        final userProfile = await authService.signup(
          username: _usernameCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        ref.read(userProvider).setUserData(profile: userProfile);
        _stopLoading();
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MainScreenPageRoute(builder: (context) => const CreateProfile()),
          );
        }
      } catch (e) {
        print('err: $e');
        if (context.mounted) {
          _stopLoading();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Unsoedfess',
                            style: GoogleFonts.merriweather(fontWeight: FontWeight.w900)
                                .copyWith(fontSize: 26))
                      ],
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              const Spacer(),
              Text("Create Account",
                  style:
                      GoogleFonts.nunitoSans(fontWeight: FontWeight.w800).copyWith(fontSize: 30)),
              const SizedBox(height: 5),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      formField(
                          hintText: "Username",
                          controller: _usernameCtrl,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              _stopLoading();
                              return "Username cannot be empty";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      formField(
                          hintText: "Email",
                          controller: _emailCtrl,
                          validator: (String? val) {
                            if (val == null || val.isEmpty) {
                              _stopLoading();
                              return "Email cannot be empty";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      formField(
                          hintText: 'Password',
                          controller: _passwordCtrl,
                          obscureText: true,
                          validator: (String? val) {
                            if (val!.length < 8) {
                              _stopLoading();
                              return "Password atleast 8 characters";
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : () => _onSignUpPressed(context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  _isLoading ? Colors.grey : Colors.black)),
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
                    ],
                  )),
              const SizedBox(height: 2),
              signUpWithGoogle(),
              // const Spacer(),
              const SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secAnimation) => const SignIn()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text("Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget formField(
      {hintText, obscureText = false, controller, String? Function(String?)? validator}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              hintStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal),
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
              // border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox signUpWithGoogle() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.grey.shade300)),
            overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
            backgroundColor: const MaterialStatePropertyAll(Colors.white)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22, child: Image.asset('assets/images/google-logo.png')),
            const SizedBox(width: 10),
            const Text(
              "Continue With Google",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
            child: TextFormField(
              controller: controller,
              validator: (value) {
                return null;
                // if(value == null || value.isEmpty){
                //   return ""
                // }
              },
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

class MainScreenPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  MainScreenPageRoute({builder}) : super(builder: builder);
}
