// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/home.dart';
import 'package:job_finder/login.dart';
import 'package:job_finder/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDLwZmbDykrRKvsFrMuyvfivFlf2U0saUA",
        authDomain: "jf-flutter.firebaseapp.com",
        projectId: "jf-flutter",
        storageBucket: "jf-flutter.firebasestorage.app",
        messagingSenderId: "133136388432",
        appId: "1:133136388432:web:5e8cacc0690176c1f45c55",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log("User is currently signed out.");
      } else {
        log("User is signed in.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}
