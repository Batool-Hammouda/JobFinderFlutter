import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/signup.dart';
import 'package:job_finder/welcome_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isButtonEnabled = false;
  FirebaseAuth auth= FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

void _validateForm() {
    final email = _emailController.text;
    final password = _passwordController.text;

    final isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(email);

    final isValid = isEmailValid && password.isNotEmpty;

    if (isButtonEnabled != isValid) {
      setState(() {
        isButtonEnabled = isValid;
      });
    }
  }

Future <bool> signInWithEmailAndPassword(String email, String password)async{
    try {
 await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    log('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    log('Wrong password provided for that user.');
  }
  return false;
}
  }

    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                "Welcome Back",
                style: GoogleFonts.lato(
                  fontSize: 32,
                ),
              ),
              Text(
                "I'm happy to see you again",
                style: GoogleFonts.lato(
                  fontSize: 17,
                  color: Colors.grey 
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
                TextButton(onPressed: (){
                  print("somthing");
                }, 
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Color(0xFF475BD8)
                  ),
                  )
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: isButtonEnabled
                    ? () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                       final success = await signInWithEmailAndPassword(email,password);
                       if(success){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => WelcomeScreen()),
                        );  
                      }else{
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed. Check your credentials.')),);
                    }
                    }
                    : null,
                style:ElevatedButton.styleFrom(
                   backgroundColor:
                      isButtonEnabled ? Color(0xFF475BD8) : Colors.grey,
                ), 
                child: Text(
                  "Sign In",
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
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Signup()),
                        );
                    },
                     child: Text(
                      "Create account",
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