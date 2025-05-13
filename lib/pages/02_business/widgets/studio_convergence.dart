import 'package:flutter/material.dart';
import 'package:company_home/common/index.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StudioConvergence extends StatelessWidget {
  const StudioConvergence({super.key});

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
          image: AssetImage('assets/img/studio_convergence.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(150),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_convergence.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(150),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/studio_convergence.webp'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withAlpha(150),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '첨단 컨버전스 이러닝 스튜디오',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 22,
              tablet: 24,
              desktop: 28,
            ),
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 24,
            desktop: 32,
          ),
        ),
        Text(
          '1인 스튜디오 + 크로마키 스튜디오 + 블랙·화이트 스튜디오 + 영상편집실 + 통합컨트롤룸 + 회의 및 사무공간',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 16,
              desktop: 18,
            ),
            fontFamily: 'Paperlogy',
            color: Colors.white,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        Text.rich(
          TextSpan(
            text: '= ',
            style: TextStyle(
              fontSize: getValueForScreenType(
                context: context,
                mobile: 16,
                tablet: 18,
                desktop: 20,
              ),
              fontFamily: 'Paperlogy',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
            children: [
              TextSpan(
                text: ' 모든 공간을 하나로 통합',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 18,
                    desktop: 20,
                  ),
                  fontFamily: 'Paperlogy',
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w800,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '한 종합 스튜디오 시스템',
                style: TextStyle(
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 16,
                    tablet: 18,
                    desktop: 20,
                  ),
                  fontFamily: 'Paperlogy',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getValueForScreenType(
            context: context,
            mobile: 24,
            tablet: 30,
            desktop: 36,
          ),
        ),
        Text(
          '''
📌 국내 대학 최초 NDI 네트워크 스튜디오 구축
📌 국내 대학 최초 IoT 기술을 통한 영상·오디오·녹화기·전원·타이머 자동화
📌 한국연구재단 부산울산경남권역 대학혁신지원사업 우수사례로 선정
📌 KERIS(한국교육학술정보원) 전국 우수 인프라 견학 대상 선정
📌 벤처마킹을 위한 타 기관 방문만 100회 이상 진행된 선진 모델
''',
          style: TextStyle(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
            fontFamily: 'Paperlogy',
            color: Colors.white,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
