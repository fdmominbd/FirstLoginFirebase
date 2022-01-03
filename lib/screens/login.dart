import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momin_firebase/helper/custom_bfield.dart';
import 'package:momin_firebase/helper/custom_tfield.dart';
import 'package:momin_firebase/screens/homePage.dart';
import 'package:momin_firebase/screens/sinUp.dart';
import 'package:momin_firebase/utills/allColor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final _auth= FirebaseAuth.instance;

TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
AllColor allColor=AllColor();

class _LoginPageState extends State<LoginPage> {
  final  _formKey=
  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Icon(
              Icons.star,size: 80,color: allColor.appColor,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTField(emailController: _emailController,
              labelText: "Email",
              hintText: "Enter your email",
              obsecureVal: false,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTField(emailController: _passController,
              labelText: "Password",
              hintText: "Enter Password",
              obsecureVal: true,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                signIn(
                    _emailController.text
                    , _passController.text,
                    context, _formKey);
              },
              child: CustomButton(
                height: 50,
                width: 300,
                btnText: "LOG IN",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style:
                TextStyle( fontSize: 18),),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context)=>SinUp()));
                  },
                  child: Text(" Sign Up",style:
                  TextStyle( fontSize: 18,
                      color: allColor.appColor),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void signIn(String email, String password
    ,context, _formKey)async{
  if(_formKey.currentState!.validate())
  {
    await _auth.signInWithEmailAndPassword
      (email: email, password: password)
        .then((value) => {
      Fluttertoast.showToast(
          backgroundColor: Colors.green,
          msg: "Login Successful!!"),
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context)=>HomePage()))
    }).catchError((e){
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: "Wrong Information!!");
    });

  }
}