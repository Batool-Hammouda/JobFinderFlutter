import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
    return Scaffold(
        backgroundColor: Color(0xFF475BD8),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/jf icon.png'),
              Text(
                'Job Finder',
                style: GoogleFonts.lato(
                  fontWeight:FontWeight.w400,
                  fontSize: 24,
                  color: Colors.white
                ), 
              ),
              Text(
                'Explore Your Dream\nJobs',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16
                ),
              )
            ],
          ),
        )
    );
  }
}