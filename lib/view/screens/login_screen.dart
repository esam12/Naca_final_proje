import 'package:final_proje/core/constant/routes.dart';
import 'package:final_proje/view/widgets/login_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userNameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  // Login function
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 12, right: 12, top: 0, bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15),
                        blurRadius: 15),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10),
                        blurRadius: 10)
                  ]),
              child: _buildForm(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    User? user = await loginUsingEmailPassword(
        email: _userNameCtrl.text,
        password: _passwordCtrl.text,
        context: context);
    setState(() {
      _isLoading = true;
    });
    print(user);
    if (user != null) {
      Get.offAndToNamed(AppRoute.home);
      print("Success");
    } else {
      setState(() {
        _isLoading = false;
      });
      Get.defaultDialog(
          title: "Error", middleText: "Your Email Or Password Not Correct!");
    }
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _userNameCtrl,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "user@example.com",
                errorStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                  size: 26,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (String? text) {
                if (text!.isEmpty) {
                  return "This Field is Required";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordCtrl,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                labelText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                  size: 26,
                ),
              ),
              obscureText: true,
              validator: (String? text) {
                if (text!.isEmpty) {
                  return "This Field is Required";
                }
                return null;
              },
            ),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    if (_isLoading) {
      return Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(top: 10.0),
        child: Container(
          alignment: Alignment.center,
          width: 140,
          height: 50,
          child: Lottie.asset("assets/lottie/loading.json",
              width: 200, height: 200),
        ),
      );
    }
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        child: Container(
          alignment: Alignment.centerRight,
          width: 140,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0x996790FB),
                Color(0xFF2661FA),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2661FA).withOpacity(.3),
                offset: const Offset(0.0, 8.0),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _onLogin(context);
              },
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
