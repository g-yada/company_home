import 'package:company_home/pages/02_business/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '스튜디오'),
        StudioIntro(),
        StudioConvergence(),
        StudioEach(),
        Footer(),
      ],
    );
  }
}
