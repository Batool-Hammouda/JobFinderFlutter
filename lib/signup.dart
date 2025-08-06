import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _passConfirmation=TextEditingController();
final TextEditingController _username =TextEditingController();
bool isButtonEnabled = false;
FirebaseAuth auth= FirebaseAuth.instance;


@override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _passConfirmation.addListener(_validateForm);
  }

void _validateForm() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirm=_passConfirmation.text;
    final username=_username.text;

    final isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(email);
    
    final confirmed= password.isNotEmpty&&(password==confirm);
    final isValid = isEmailValid && confirmed&&username.isNotEmpty;

    if (isButtonEnabled != isValid) {
      setState(() {
        isButtonEnabled = isValid;
      });
    }
  }

Future<bool> signUpWithEmailAndPassword(String email, String password, String username) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': email,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    }
  } catch (e) {
    log(e.toString());
  }

  return false; 
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/jf filled.png',
              width: 70,
              height: 70,
              ),
              Text(
                "Welcome",
                style: GoogleFonts.lato(
                  fontSize: 32,
                ),
              ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: 'username',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true, 
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                 TextField(
                  controller: _passConfirmation,
                  obscureText: true, 
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: isButtonEnabled
                    ? () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final uname=_username.text;
                      final success = await signUpWithEmailAndPassword(email,password,uname);
                       if(success){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Login()),
                        );  
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed.')),);
                    }
                    }
                    : null,
                style:ElevatedButton.styleFrom(
                   backgroundColor:
                      isButtonEnabled ? Color(0xFF475BD8) : Colors.grey,
                ), 
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  )
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Already Registered?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()),);
                    },
                     child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF475BD8),
                        fontSize: 16
                      ),
                     )
                     )
                  ],
                )   
          ],
        ),
      ),
    );
  }
}