import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 1500, tablet: 1190, watch: 0),
      mobile: (context) => MobileHero(),
      tablet: (context) => TabletHero(),
      desktop: (context) => DesktopHero(),
    );
  }
}

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 200),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/hero_img.png'),
          fit: BoxFit.none,
          scale: 1.5,
          alignment: Alignment(0.7, 0),
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SlideInSection(
          alignment: 'left',
          children: [
            Text(
              'Media + Design + Knowledge',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: '스마트 캠퍼스',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
                children: [
                  TextSpan(
                    text: '를 위한\n혁신적 교육 플랫폼',
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
              'IoT, AI, 빅데이터, 디지털 트윈 등 최신기술을 바탕으로\n교육 생태계 내 모든 이해관계자를 연결하는 솔루션을 제공합니다',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),

            SizedBox(height: 28),
            RedButton(buttonName: '상담/문의하기', path: '/service'),
          ],
        ),
      ),
    );
  }
}

class TabletHero extends StatelessWidget {
  const TabletHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 120),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/img/hero_img.png'),
          fit: BoxFit.none,
          scale: 1.5,
          alignment: Alignment(0.9, 0),
        ),
      ),
      alignment: Alignment.center,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SlideInSection(
          alignment: 'left',
          children: [
            Text(
              'Media + Design + Knowledge',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
              ),
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: '스마트 캠퍼스',
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD4373C),
                ),
                children: [
                  TextSpan(
                    text: '를 위한\n혁신적 교육 플랫폼',
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
              'IoT, AI, 빅데이터, 디지털 트윈 등 최신기술을 바탕으로\n교육 생태계 내 모든 이해관계자를 연결하는 솔루션을 제공합니다',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: Colors.black,
              ),
            ),

            SizedBox(height: 28),
            RedButton(buttonName: '상담/문의하기', path: '/service'),
          ],
        ),
      ),
    );
  }
}

class MobileHero extends StatelessWidget {
  const MobileHero({super.key});

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
              image: AssetImage('assets/img/hero_img.png'),
              fit: BoxFit.contain,
              alignment: Alignment.centerRight,
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
                'Media + Design + Knowledge',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: '스마트 캠퍼스',
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD4373C),
                  ),
                  children: [
                    TextSpan(
                      text: '를 위한\n혁신적 교육 플랫폼',
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
                'IoT, AI, 빅데이터, 디지털 트윈 등 최신기술을 바탕으로\n교육 생태계 내 모든 이해관계자를 연결하는 솔루션을 제공합니다',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              RedButton(buttonName: '상담/문의하기', path: '/service'),
            ],
          ),
        ),
      ],
    );
  }
}
