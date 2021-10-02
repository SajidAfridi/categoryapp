import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/util/route.dart';
import'package:velocity_x/velocity_x.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? _email, _password;
  bool changeButton= false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  moveToLogIn(BuildContext context)async {
    if(formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.logInRoute);
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
                Image.asset(
                  "assets/images/login2.png",
                  fit: BoxFit.cover,
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
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
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
                    borderRadius: BorderRadius.circular(changeButton? 50:8),
                    child: InkWell(
                      onTap: ()=>  signUp(),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 250,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Row(
                              children: [
                              Icon(Icons.cloud_done, color: Colors.teal,).w10(context),
                              "Registration Complete".text.xl.color(context.theme.secondaryHeaderColor).make(),
                                ],
                              )
                            : Text(
                              "REGISTER",
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                  ),
                          ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void signUp() async {
    print("camhere");
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword (email: _email!, password: _password!);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => moveToLogIn(context)));
      }catch(e) {
        print(e);
      }
    }
  }
}
