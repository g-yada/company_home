import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Color(0xFF3D3F3D),
      width: double.infinity,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'FOOTER',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Paperlogy',
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ],
      ),
    );
  }
}
