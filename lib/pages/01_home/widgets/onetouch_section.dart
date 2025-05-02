import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OnetouchSection extends StatelessWidget {
  const OnetouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      child: Center(child: Text('원터치 통합 제어 시스템')),
    );
  }
}
