import 'package:flutter/material.dart';

class KeyIcon extends StatelessWidget {
  const KeyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.square_rounded,
                      color: Color.fromRGBO(249, 167, 53, 1.0),
                      size: 140.0,
                    ),
                    Icon(
                    Icons.key_sharp,
                    color: Colors.white,
                    size: 80.0,
                    ),
                  ],
                );
  }
}