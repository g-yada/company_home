import 'package:company_home/common/color.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SmartClassIntro extends StatelessWidget {
  const SmartClassIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildMobile(context),
      tablet: (context) => _buildTablet(context),
      desktop: (context) => _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_intro.webp'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(100),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 32),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_intro.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(100),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 24),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: 16),
            Image.asset('assets/img/studio_intro.webp', fit: BoxFit.cover),
            SizedBox(height: 16),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '―  학습의 공간을 미래로 연결하다  ― ',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 18,
              tablet: 20,
              desktop: 24,
            ),
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            backgroundColor: PLAIN_COLOR,
          ),
        ),
        SizedBox(height: 12),
        Text.rich(
          TextSpan(
            text: '변화하는 교육환경에 최적화된 ',
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: 22,
                tablet: 24,
                desktop: 28,
              ),
              fontFamily: 'Paperlogy',
              fontWeight: FontWeight.w700,
              color: PLAIN_COLOR,
            ),
            children: [
              TextSpan(
                text: '\n첨단 스마트 강의실 ',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 22,
                    tablet: 24,
                    desktop: 28,
                  ),
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              TextSpan(
                text: '구축',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 22,
                    tablet: 24,
                    desktop: 28,
                  ),
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PLAIN_COLOR,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      '''강의실은 이제 단순한 지식 전달의 공간이 아닌, 소통과 협업을 돕는 공간이 되어야 합니다.

MDK는 다양한 학습/수업 방식에 대응할 수 있는 맞춤형 첨단 교육공간을 설계·구축해드립니다.

각 강의실은 IoT 기반 제어 시스템을 통해 조명, 냉난방, AV 장비 등을 일괄 제어할 수 있으며,
강의자/관리자 중심의 운영 편의성을 고려한 관리 애플리케이션이 함께 제공되어 시대의 흐름에 부합하는 미래형 강의실을 구현합니다.''',
      style: TextStyle(
        fontSize: getValueForScreenType(
          context: context,
          mobile: 14,
          tablet: 15,
          desktop: 16,
        ),
        fontFamily: 'Paperlogy',
        color: PLAIN_COLOR,
        height: 1.2,
      ),
    );
  }
}
