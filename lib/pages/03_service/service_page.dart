import 'package:company_home/pages/03_service/widgets/service_form.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      children: const [
        SizedBox(height: 50),
        ServiceForm(),
        SizedBox(height: 50),
        Footer(),
      ],
    );
  }
}
