import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unsoedfess/features/auth/signup.dart';
import 'package:unsoedfess/features/main_screen/screens/main_screen.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  void _startLoading() {
    setState(() => _isLoading = true);
  }

  void _stopLoading() {
    setState(() => _isLoading = false);
  }

  Future<void> signin(BuildContext context) async {
    _startLoading();
    try {
      // log(ref.watch(titleProvider));
      // ref.read(titleProvider.notifier).state += " Pro";
      // final body = {'username': username, 'password': password};
      // final body = {'username': username, 'password': password};
      // final response = await ApiService.post(AuthAPI.signin, body);
      // print(response.body);
      // final userProfile = UserProfile(
      //   avatar: "",
      //   email: '',
      //   password: _passwordCtrl.text,
      //   username: _usernameCtrl.text,
      //   displayName: _usernameCtrl.text,
      //   bio: "",
      //   followers: 0,
      //   followings: 0,
      //   posts: 0,
      // );
      // final container = ProviderContainer();
      // container.read(userProvider).setUserData(profile: userProfile, token: 'token');
      // print(container.read(userProvider).profile?.toJson());

      await Future.delayed(const Duration(seconds: 1));
      _stopLoading();
      if (context.mounted) {
        Navigator.push(context, MainScreenPageRoute(builder: (context) => const MainScreen()));
      }
    } catch (e) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 10),
            Text("Sign In",
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800).copyWith(fontSize: 30)),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextInput(hintText: 'Username', controller: _usernameCtrl),
                  const SizedBox(height: 10),
                  CustomTextInput(
                      hintText: 'Password', controller: _passwordCtrl, obscureText: true),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : () => signin(context),
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
                                child:
                                    CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
                          const SizedBox(width: 15),
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)), // Change the border color to grey
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secAnimation) => const SignUp()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

class MainScreenPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  MainScreenPageRoute({builder}) : super(builder: builder);
}
