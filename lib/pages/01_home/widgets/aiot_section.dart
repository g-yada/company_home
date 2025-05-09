import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AiotSection extends StatelessWidget {
  const AiotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 1500, tablet: 1190, watch: 0),
      mobile: (context) => MobileAIoT(),
      tablet: (context) => DesktopAIoT(),
      desktop: (context) => DesktopAIoT(),
    );
  }
}

class DesktopAIoT extends StatelessWidget {
  const DesktopAIoT({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/aiot_img.webp'),
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.5),
            ),
          ),
        ),
        Container(
          height: 320,
          padding: const EdgeInsets.fromLTRB(0, 45, 0, 10),
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.6)),
          child: SlideInSection(
            children: [
              Text(
                '인공지능 & 사물인터넷 연구·개발',
                style: TextStyle(
                  fontSize: 38,
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
              SizedBox(height: 32),
              Text(
                '온-프레미스(On-Premise) 생성형 AI 시스템 구축',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'OpenCV 기반 AI 영상분석 및 인식 연구',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'IoT 기반 컨트롤 시스템 개발',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'IoT 기술과 센서 접목을 통한 탄소저감 실현 (ESG 구현)',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileAIoT extends StatelessWidget {
  const MobileAIoT({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/aiot_img.webp'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.7)),
          alignment: Alignment.center,
          child: SlideInSection(
            children: [
              Text(
                '인공지능 & 사물인터넷\n연구·개발',
                style: TextStyle(
                  fontSize: 38,
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
              SizedBox(height: 32),
              Text(
                '온-프레미스(On-Premise) 생성형 AI 시스템 구축',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'OpenCV 기반 AI 영상분석 및 인식 연구',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'IoT 기반 컨트롤 시스템 개발',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'IoT 기술과 센서 접목을 통한 탄소저감 실현 (ESG 구현)',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
