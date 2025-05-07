import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 1500, tablet: 1190, watch: 0),
      mobile: (context) => MobileContents(),
      tablet: (context) => DesktopContents(),
      desktop: (context) => DesktopContents(),
    );
  }
}

class DesktopContents extends StatelessWidget {
  const DesktopContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/content.webp'),
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.5),
            ),
          ),
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
          width: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.8)),
          child: SlideInSection(
            children: [
              Text(
                '영상 네트워크 기술을 활용한',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD4373C),
                ),
              ),
              Text(
                '콘텐츠 제작 공간의 혁신',
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
              SizedBox(height: 24),
              RedButton(buttonName: '자세히 보기', path: '/business/studio'),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileContents extends StatelessWidget {
  const MobileContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/content.webp'),
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
                '영상 네트워크 기술을 활용한',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD4373C),
                ),
              ),
              Text(
                '콘텐츠 제작 공간의 혁신',
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
              SizedBox(height: 22),
              RedButton(buttonName: '자세히 보기', path: '/business/studio'),
            ],
          ),
        ),
      ],
    );
  }
}
