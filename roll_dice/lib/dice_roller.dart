import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var dice = 1;
  var rand = Random();

  void roll() {
    setState(() {
      dice = rand.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Image.asset('assets/images/dice-$dice.png', width: 200),

        const SizedBox(height: 20),

        OutlinedButton(
          onPressed: roll,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 24),
          ),
          child: Text("Roll Dice"),
        ),
      ],
    );
  }
}
