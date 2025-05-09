import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DigitaltwinSection extends StatelessWidget {
  const DigitaltwinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 1600, tablet: 1200, watch: 0),
      mobile: (context) => MobileDtwin(),
      tablet: (context) => TabletDtwin(),
      desktop: (context) => DesktopDtwin(),
    );
  }
}

class DesktopDtwin extends StatelessWidget {
  const DesktopDtwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 200),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/digital_twin_s.webp'),
          fit: BoxFit.fitHeight,
          scale: 1.5,
          alignment: Alignment(0.8, 0),
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SlideInSection(
          alignment: 'left',
          children: [
            Text.rich(
              TextSpan(
                text: '디지털 트윈',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
                children: [
                  TextSpan(
                    text: '\n시뮬레이션 설계',
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '가상 물리엔진을 통해 2D 도면을 3D로 현실에 가깝게 구현하여,\n완성된 공간을 제안 단계에서 미리 체험할 수 있습니다.\n공간구성, 기자재 배치, 연결성을 꼼꼼히 사전 테스트하여 최적화된 공간을 제공합니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabletDtwin extends StatelessWidget {
  const TabletDtwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/digital_twin_s.webp'),
          fit: BoxFit.fitHeight,
          scale: 1.5,
          alignment: Alignment(1, 0),
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SlideInSection(
          alignment: 'left',
          children: [
            Text.rich(
              TextSpan(
                text: '디지털 트윈',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
                children: [
                  TextSpan(
                    text: '\n시뮬레이션 설계',
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '가상 물리엔진을 통해 2D 도면을 3D로 현실에 가깝게 구현하여,\n완성된 공간을 제안 단계에서 미리 체험할 수 있습니다.\n공간구성, 기자재 배치, 연결성을 꼼꼼히 사전 테스트하여 최적화된 공간을 제공합니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileDtwin extends StatelessWidget {
  const MobileDtwin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/img/digital_twin_s.webp'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: Colors.white.withOpacity(0.8)),
        ),
        Align(
          alignment: Alignment.center,
          child: SlideInSection(
            children: [
              Text(
                '디지털 트윈',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
              ),
              Text(
                '시뮬레이션 설계',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '가상 물리엔진을 통해 2D 도면을 3D로 현실에 가깝게 구현하여,\n완성된 공간을 제안 단계에서 미리 체험할 수 있습니다.\n공간구성, 기자재 배치, 연결성을 꼼꼼히 사전 테스트하여 최적화된 공간을 제공합니다.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
