import 'package:flutter/material.dart';
import 'package:flutter_catalog/util/route.dart';
import 'package:velocity_x/velocity_x.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String username='';
  bool changeButton= false;
  final formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context)async{
    if(formKey.currentState!.validate()){
      setState(() {
        changeButton= true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton= false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
      child: SingleChildScrollView(
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
                "Welcome $username",
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
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username*"
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Email cannot be empty";
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            username = value;
                          });
                        },
                      ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password*"
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length <6 ){
                          return "Password length must be at least 6";
                        }
                      },
                    ),
                    SizedBox(height: 40.0,),

                    Material(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(changeButton? 50:8),
                      child: InkWell(
                        onTap: ()=> moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 40: 120,
                          height: 40,
                          alignment: Alignment.center,
                          child: changeButton? Icon(Icons.done, color: Colors.white,) : Text(
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
                    ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

