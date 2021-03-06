import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:momin_firebase/helper/custom_bfield.dart';
import 'package:momin_firebase/helper/custom_tfield.dart';
import 'package:momin_firebase/screens/login.dart';

class SinUp extends StatefulWidget {
  const SinUp({Key? key}) : super(key: key);

  @override
  _SinUpState createState() => _SinUpState();
}

final _auth=FirebaseAuth.instance;

TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
TextEditingController _confirmPassController=TextEditingController();

class _SinUpState extends State<SinUp> {

final _formKeySignUp
= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKeySignUp,
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
              CustomTField(
                emailController: _confirmPassController,
                labelText: "Confirm Password",
                hintText: "Re-enter Password",
                obsecureVal: true,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  signUp(
                      _emailController.text,
                      _passController.text,
                      context,_formKeySignUp);
                },
                child: CustomButton(
                  height: 50,
                  width: 300,
                  btnText: "SIGN UP",
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void signUp(String email, String password,
    context, _formKeySignUp)async{
  if(_formKeySignUp.currentState!.validate())
  {
    await _auth.createUserWithEmailAndPassword
      (email: email, password: password)
        .then((value) => {
      Fluttertoast.showToast
        (msg:"Account Created Successfully!!"),
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context)=>LoginPage()))
    }).catchError((e){
      Fluttertoast.showToast(msg: e.message);
    });
  }
}