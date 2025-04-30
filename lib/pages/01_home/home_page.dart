import 'package:company_home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/layout_main.dart';
import 'widgets/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: const [HeroSection(), ContentSection(), Footer()],
    );
  }
}
