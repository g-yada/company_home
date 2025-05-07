import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '회사소개', selectedSub: '회사개요'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
