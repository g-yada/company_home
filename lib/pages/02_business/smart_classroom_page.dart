import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class SmartClassroomPage extends StatelessWidget {
  const SmartClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '첨단강의실'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
