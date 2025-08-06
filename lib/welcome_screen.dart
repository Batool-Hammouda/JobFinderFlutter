import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/home.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/jf filled.png',
                width: 40,
                height: 40,
                ),
                SizedBox(
                      height: 25,
                    ),
                Image.asset(
                'assets/welcome_image.png',
                width: 100,
                height: 100,
                ),
                SizedBox(
                      height: 10,
                    ),
                 Text(
                    "Welcome Job Hunter",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.black 
                    ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                    "I'm happy to see you again, let's explore new\n dream jobs for your career",
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.grey 
                    ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home())), 
                      style:ElevatedButton.styleFrom(
                       backgroundColor:Color(0xFF475BD8),
                      ), 
                      child:Text(
                    "Start Explore Jobs",
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.white 
                    ),
                    ),
                       )
            ],
          ),
        ),
      ),
    );
  }
}