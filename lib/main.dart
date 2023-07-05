import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const DiceApp());
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int player1DiceNumber = 0;
  int player2DiceNumber = 0;
  String winnerLabel = 'Play Now !!';
  int resetTimer = 3;
  String restartLable = '';
  bool disableDicePlayer1 = false;
  bool disableDicePlayer2 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dice App',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                winnerLabel,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AbsorbPointer(
                  absorbing: disableDicePlayer1,
                  child: GestureDetector(
                    onTap: () {
                      player1DiceNumber = 1 + Random().nextInt(6);
                      disableDicePlayer1 = true;
                      disableDicePlayer2 = false;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'images/dice$player1DiceNumber.png',
                          height: 160,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Player - 1',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                AbsorbPointer(
                  absorbing: disableDicePlayer2,
                  child: GestureDetector(
                    onTap: () {
                      player2DiceNumber = 1 + Random().nextInt(6);
                      disableDicePlayer2 = true;

                      if (player1DiceNumber > player2DiceNumber) {
                        winnerLabel = 'Player - 1 Win';
                      } else if (player1DiceNumber == player2DiceNumber) {
                        winnerLabel = 'Match Draw, Play again...';
                      } else {
                        winnerLabel = 'Player - 2 Win';
                      }

                      Timer _timer = Timer.periodic(
                        const Duration(seconds: 1),
                        ((timer) => {
                              setState(() {
                                restartLable =
                                    'Game is restarting in $resetTimer seconds...';
                                restartTimer();
                              })
                            }),
                      );

                      setState(() {});
                      Future.delayed(Duration(seconds: resetTimer + 1), () {
                        winnerLabel = 'Play Now !!';
                        player1DiceNumber = 0;
                        player2DiceNumber = 0;
                        restartLable = '';
                        resetTimer = 3;
                        disableDicePlayer1 = false;
                        disableDicePlayer2 = true;
                        _timer.cancel();
                        setState(() {});
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'images/dice$player2DiceNumber.png',
                          height: 160,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Player - 2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                restartLable,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void restartTimer() {
    resetTimer--;
  }
}
