import 'package:flutter/material.dart';
import 'navbar.dart';
import 'footer.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const Navbar(), Expanded(child: child), const Footer()],
      ),
    );
  }
}
