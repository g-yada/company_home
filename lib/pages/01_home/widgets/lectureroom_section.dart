import 'package:flutter/material.dart';
import 'dart:math';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LectureroomSection extends StatelessWidget {
  const LectureroomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 1665, tablet: 800, watch: 0),
      mobile: (context) => LectureRoom(paddingValue: 50),
      tablet: (context) => LectureRoom(paddingValue: 100),
      desktop: (context) => LectureRoom(paddingValue: 200),
    );
  }
}

class LectureRoom extends StatelessWidget {
  final double paddingValue;

  const LectureRoom({required this.paddingValue, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: SlideInSection(
                alignment: 'left',
                children: [
                  Text(
                    '학습자와 교수자 모두를 위한',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD4373C),
                    ),
                  ),
                  Text(
                    '첨단 강의공간 구현',
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth;
                double cardWidth = 380;
                return Wrap(
                  spacing: 30, // 좌우 간격
                  runSpacing: 30, // 위아래 간격
                  alignment: WrapAlignment.center,
                  children: [
                    _Card(
                      cardTitle: 'HYFLEX',
                      isTitleColorWhite: true,
                      alignmentX: -0.7,
                      cardImage: 'assets/img/hyflex.webp',
                      cardWidth: cardWidth,
                    ),
                    _Card(
                      cardTitle: 'PBL',
                      isTitleColorWhite: true,
                      alignmentX: -0.3,
                      cardImage: 'assets/img/pbl.webp',
                      cardWidth: cardWidth,
                    ),
                    _Card(
                      cardTitle: 'CODING',
                      isTitleColorWhite: false,
                      alignmentX: 0,
                      cardImage: 'assets/img/coding.webp',
                      cardWidth: cardWidth,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String cardTitle;
  final String cardImage;
  final double alignmentX;
  final bool isTitleColorWhite;
  final double cardWidth;

  const _Card({
    required this.cardTitle,
    required this.cardImage,
    required this.alignmentX,
    required this.isTitleColorWhite,
    required this.cardWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(cardImage),
          fit: BoxFit.cover,
          alignment: Alignment(alignmentX, 0),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cardTitle,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Paperlogy',
              color: isTitleColorWhite ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            alignment: Alignment.bottomRight,
            child: WhiteButton(buttonName: '자세히 보기', path: '/djskd/sdf'),
          ),
        ],
      ),
    );
  }
}
