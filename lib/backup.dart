//My Self Code
// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(const DiceApp());
// }

// class DiceApp extends StatefulWidget {
//   const DiceApp({super.key});

//   @override
//   State<DiceApp> createState() => _DiceAppState();
// }

// class _DiceAppState extends State<DiceApp> {
//   int player1DiceNumber = 1;
//   int player2DiceNumber = 1;
//   String winnerLabel = 'Play Now !!';
//   int resetTimer = 3;
//   String restartLable = '';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'Dice App',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 50),
//               child: Text(
//                 winnerLabel,
//                 style:
//                     const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     player1DiceNumber = 1 + Random().nextInt(6);
//                     setState(() {});
//                   },
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         'images/dice$player1DiceNumber.png',
//                         height: 160,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Text(
//                           'Player - 1',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     player2DiceNumber = 1 + Random().nextInt(6);

//                     if (player1DiceNumber > player2DiceNumber) {
//                       winnerLabel = 'Player - 1 Win';
//                     } else if (player1DiceNumber == player2DiceNumber) {
//                       winnerLabel = 'Match Draw, Play again...';
//                     } else {
//                       winnerLabel = 'Player - 2 Win';
//                     }

//                     Timer _timer = Timer.periodic(
//                       const Duration(seconds: 1),
//                       ((timer) => {
//                             setState(() {
//                               restartLable =
//                                   'Game is restarting in $resetTimer seconds...';
//                               restartTimer();
//                             })
//                           }),
//                     );

//                     setState(() {});
//                     Future.delayed(Duration(seconds: resetTimer), () {
//                       winnerLabel = 'Play Now !!';
//                       player1DiceNumber = 1;
//                       player2DiceNumber = 1;
//                       restartLable = '';
//                       resetTimer = 3;
//                       _timer.cancel();
//                       setState(() {});
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         'images/dice$player2DiceNumber.png',
//                         height: 160,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Text(
//                           'Player - 2',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Text(
//                 restartLable,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void restartTimer() {
//     resetTimer--;
//   }
// }


// ---------Test With Israr----------
// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const DiceApp());
// }

// class DiceApp extends StatefulWidget {
//   const DiceApp({super.key});

//   @override
//   State<DiceApp> createState() => _DiceAppState();
// }

// class _DiceAppState extends State<DiceApp> {
//   int player1DiceNumber = 1;
//   int player2DiceNumber = 1;
//   String winnerNameLabel = 'Tap To Play';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Dice App'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 40),
//               child: Text(
//                 winnerNameLabel,
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   PlayerDice(
//                     playerDiceNo: player1DiceNumber,
//                     playerName: 'Player - 1',
//                     onTap: () {
//                       player1DiceNumber = 1 + Random().nextInt(6);
//                       setState(() {});
//                     },
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   PlayerDice(
//                     playerDiceNo: player2DiceNumber,
//                     playerName: 'Player - 2',
//                     onTap: () {
//                       player2DiceNumber = 1 + Random().nextInt(6);
//                       setState(() {
//                         if (player1DiceNumber > player2DiceNumber) {
//                           winnerNameLabel = 'Player - 1 Win';
//                         } else if (player1DiceNumber == player2DiceNumber) {
//                           winnerNameLabel = 'Match Draw !!';
//                         } else {
//                           winnerNameLabel = 'Player - 2 Win';
//                         }
//                       });

//                       Future.delayed(Duration(seconds: 3), () {
//                         player1DiceNumber = 1;
//                         player2DiceNumber = 1;
//                         winnerNameLabel = 'Tap To Play';
//                         setState(() {});
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PlayerDice extends StatelessWidget {
//   final int playerDiceNo;
//   final String playerName;
//   final VoidCallback onTap;

//   const PlayerDice({
//     super.key,
//     required this.playerDiceNo,
//     required this.onTap,
//     required this.playerName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: onTap,
//             child: Image.asset(
//               'images/dice$playerDiceNo.png',
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 10,
//             ),
//             child: Text(
//               playerName,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// -------------------