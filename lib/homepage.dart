// ignore_for_file: unnecessary_new, unused_local_variable, prefer_const_constructors

import 'dart:math';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guess_game/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fromkey = GlobalKey<FormState>();
  var colorback = Color.fromARGB(255, 35, 35, 35);

  var colorwonl = Color.fromARGB(255, 57, 168, 61);
  int score = 20;
  int hscore = 0;
  bool won = false;
  var wonltext = '';
  final TextEditingController guessed = new TextEditingController();

  @override
  void initState() {
    super.initState();
    guessed.addListener(() {
      setState(() {
        if (guessed.text.length > 0) {
          print('ok');
        } else {
          print('please enter ');
        }
      });
    });
  }

  Random random = new Random();
  int randomNumber = 0;
  void addrandom() {
    setState(() {
      random = new Random();
      randomNumber = random.nextInt(101);
    });
  }

  void playagain() {
    addrandom();
    colorback = Color.fromARGB(255, 35, 35, 35);
    colorwonl = Color.fromARGB(255, 57, 168, 61);
    score = 20;
    won = false;
    wonltext = '';
  }

  void highscoreC() {
    if (score > hscore) {
      hscore = score;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorback,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 130),
              Text(
                'Score: $score',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Highscore: $hscore',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 110,
              ),
              Text(
                'Guess The Number',
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
              SizedBox(height: 20),
              Text(
                wonltext,
                style: GoogleFonts.pressStart2p(
                  fontSize: 30,
                  color: colorwonl,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: 440,
                  child: TextFormField(
                    controller: guessed,
                    key: fromkey,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontWeight: FontWeight.w500),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(13),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 168, 238, 141),
                        ),
                      ),
                      labelText: 'I Guess!',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    style: GoogleFonts.pressStart2p(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || int.tryParse(value) == null) {
                        return "Must Be an integer";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (randomNumber == 0) {
                    playagain();
                  }
                  int guessedd = int.parse(guessed.text);
                  print(guessedd);
                  if (score < 1) {
                    setState(() {
                      print('lost');
                      wonltext = 'Lost!!';
                      won = false;
                      colorwonl = Color.fromARGB(255, 255, 97, 69);
                      colorback = Color.fromARGB(255, 168, 57, 57);
                    });
                  } else if (guessedd < randomNumber && !won) {
                    setState(() {
                      colorwonl = Color.fromARGB(255, 255, 97, 69);
                      score--;
                      wonltext = 'Too low!';
                      won = false;
                    });
                    print('too low!');
                  } else if (guessedd > randomNumber && !won) {
                    setState(() {
                      colorwonl = Color.fromARGB(255, 255, 97, 69);
                      score--;

                      wonltext = 'Too High!';
                    });
                  } else if (guessed.text == randomNumber.toString()) {
                    setState(
                      () {
                        if (guessed.text == randomNumber.toString()) {
                          highscoreC();
                          won = true;

                          print('won');
                          wonltext = 'Won!!';
                          colorwonl = Color.fromARGB(255, 112, 255, 69);
                          colorback = Color.fromARGB(255, 57, 168, 87);
                        }
                      },
                    );
                  }
                  print(randomNumber);
                },
                child: Text(
                  'Check!',
                  style: GoogleFonts.pressStart2p(
                    shadows: [
                      const Shadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          blurRadius: 20)
                    ],
                    fontSize: 10,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  playagain();
                  print(randomNumber);
                },
                child: Text(
                  'Play Again!!',
                  style: GoogleFonts.pressStart2p(
                    shadows: [
                      const Shadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          blurRadius: 20)
                    ],
                    fontSize: 10,
                    color: const Color.fromARGB(255, 255, 255, 255),
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
