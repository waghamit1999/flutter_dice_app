import 'package:flutter/material.dart';

class PlayerDice extends StatelessWidget {
  final int diceNumber;
  final VoidCallback onTap;
  final String playerName;

  const PlayerDice({
    super.key,
    required this.diceNumber,
    required this.onTap,
    required this.playerName,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            'images/dice$diceNumber.png',
            height: 160,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              playerName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
