import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/flutter_auth/errorHandling.dart';
import 'package:flutter_catalog/util/route.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _email, _password;
  bool changeButton = false;
  moveToHome(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/login2.png",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/login2.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  top: 35,
                  child: Material(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, MyRoute.registerRoute),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 120,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0,),
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) {
                        return "Please enter your email address";
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                      hintText: 'Enter your email here',
                      labelText: 'Email*',
                    ),
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return "Password length must be greater than 6";
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                      hintText: 'Enter password here',
                      labelText: 'Password*',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 40.0,),

                  Material(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => signIn(),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 40 : 120,
                        height: 40,
                        alignment: Alignment.center,
                        child: changeButton ? Icon(
                          Icons.done, color: Colors.white,) : Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  textToRegister(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textToRegister() {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'If you are want to Register Then ',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,),),
                TextSpan(
                  text: 'click here',
                  style: TextStyle(color: Colors.blue,fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = goToRegister,
                ),
              ]
          ),
        ),
      ],
    );
  }

  Future goToRegister() async {
      setState(() {
        changeButton = true;
      });
      await Navigator.pushNamed(context, MyRoute.registerRoute);
      setState(() {
        changeButton = false;
      });
    }
  void signIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Future<String> inputData() async {
      final User user = auth.currentUser!;
      final uid = user.uid;
      return uid;
    }
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email!, password: _password!);
        final userid= await inputData();
        User? user= FirebaseAuth.instance.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(userEmail: user,)));
      }on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorHandling(errorHandling: "Invalid Email")));
            break;
        }
      }
    }
  }
}
