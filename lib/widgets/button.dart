import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedButton extends StatelessWidget {
  final String buttonName;
  final String path;

  const RedButton({required this.buttonName, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(path),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        backgroundColor: MaterialStateProperty.all(Color(0xFFD4373C)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontFamily: 'Paperlogy',
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  final String buttonName;
  final String path;
  final VoidCallback? onTap;

  const WhiteButton({
    required this.buttonName,
    required this.path,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () => context.go(path),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        shadowColor: MaterialStateProperty.all(Colors.black.withOpacity(0.2)),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontFamily: 'Paperlogy',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
