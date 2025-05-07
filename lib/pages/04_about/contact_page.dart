import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: [
        const SectionTitle(sectionTitle: '회사소개', selectedSub: '오시는길'),
        Container(height: 1000, width: double.infinity),
        Footer(),
      ],
    );
  }
}
