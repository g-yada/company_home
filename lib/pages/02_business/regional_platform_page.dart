import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class RegionalPlatformPage extends StatelessWidget {
  const RegionalPlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '지역혁신플랫폼'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
