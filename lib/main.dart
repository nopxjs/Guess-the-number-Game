// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_game/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Ptartpage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class Ptartpage extends StatefulWidget {
  const Ptartpage({Key? key}) : super(key: key);

  @override
  State<Ptartpage> createState() => _PtartpageState();
}

class _PtartpageState extends State<Ptartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 35, 35),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 285,
              ),
              Text(
                'Guess Game',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Between 1 to 100',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 10,
                  color: Colors.green[400],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
                child: Text(
                  'Play',
                  style: GoogleFonts.pressStart2p(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
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
