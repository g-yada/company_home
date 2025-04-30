import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/content.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: Center(
        child: SlideInSection(
          children: [
            Text(
              '콘텐츠 제작공간 혁신',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
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
                '자세히 보기',
                style: TextStyle(fontFamily: 'Paperlogy', fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
