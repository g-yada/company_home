import 'package:company_home/pages/02_business/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:company_home/common/scroll_service.dart';

class SmartClassroomPage extends StatelessWidget {
  const SmartClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '사업분야', selectedSub: '첨단강의실'),
        const SmartClassIntro(),
        SmartClassHyflex(key: ScrollService.hyflexKey),
        SmartClassPbl(key: ScrollService.pblKey),
        SmartClassCoding(key: ScrollService.codingKey),
        const Footer(),
      ],
    );
  }
}
