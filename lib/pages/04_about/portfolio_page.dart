import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '회사소개', selectedSub: '포트폴리오'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
