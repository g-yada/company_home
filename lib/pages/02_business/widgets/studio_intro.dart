import 'package:company_home/common/color.dart';
import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

class StudioIntro extends StatelessWidget {
  const StudioIntro({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text(
              '―  촬영 공간, 그 이상의 경험  ― ',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                backgroundColor: PLAIN_COLOR,
              ),
            ),
            SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: '고품질 콘텐츠 제작을 위한 ',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PLAIN_COLOR,
                ),
                children: [
                  TextSpan(
                    text: '올인원 스튜디오 ',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: PRIMARY_COLOR,
                    ),
                  ),
                  TextSpan(
                    text: '구축',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      color: PLAIN_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              '''
NDI(Network Device Interface) 기술을 기반으로
영상과 음향 신호를 네트워크를 통해 실시간으로 전송하고 제어할 수 있도록 구성해드립니다.
이를 통해 복잡한 케이블 연결 없이도 고화질의 콘텐츠 제작이 가능하며,
전체 제작 과정을 어디서든 실시간으로 확인할 수 있습니다.
              
IoT 콘트롤러를 통해 카메라, 조명 등 주요 장비를 원격으로 제어할 수 있고,
출연자와 제작자 간의 쌍방향 촬영도 지원됩니다.
              
3D 영상 합성 기능을 탑재하여 가상 배경이나 효과도 자유롭게 구현할 수 있습니다.
촬영 공간은 크로마키 스튜디오(녹색 배경), 블랙 스튜디오(몰입감 있는 화면 연출),화이트 스튜디오(제품 및 인터뷰 촬영 등) 등
다양하게 구성되어 있어 목적에 따라 최적의 제작 환경을 제공합니다.

콘텐츠 제작뿐만 아니라 실시간 온라인 강의나 화상 세미나 등 비대면 교육 및 행사 운영도 지원하는 통합형 스튜디오를 구축합니다.''',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: PLAIN_COLOR,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
