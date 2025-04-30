import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Column(),
          SlideInSection(
            children: [
              Text(
                '스마트 캠퍼스를 위한 혁신 플랫폼',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {},

                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFD4373C)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  '상담/문의하기',
                  style: TextStyle(
                    fontFamily: 'Paperlogy',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
