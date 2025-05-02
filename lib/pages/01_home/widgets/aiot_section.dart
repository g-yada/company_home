import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AiotSection extends StatelessWidget {
  const AiotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700,
      child: Center(child: Text('AIoT 연구 개발')),
    );
  }
}
