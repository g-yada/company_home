import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class HybridLearningPage extends StatelessWidget {
  const HybridLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '복합학습공간'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
