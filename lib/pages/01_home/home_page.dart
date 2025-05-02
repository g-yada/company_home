import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'widgets/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: const [
        HeroSection(),
        ContentSection(),
        LectureroomSection(),
        OnetouchSection(),
        AiotSection(),
        DigitaltwinSection(),
        Footer(),
      ],
    );
  }
}
