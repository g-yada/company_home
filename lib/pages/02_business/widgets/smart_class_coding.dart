import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:company_home/common/color.dart';

class SmartClassCoding extends StatelessWidget {
  const SmartClassCoding({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 80),
      constraints: const BoxConstraints(maxWidth: 1500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/img/coding.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '코딩(CODING) 강의실',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '실습과 협업이 자유로운 디지털 제작 특화 교육 공간',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w600,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '학생-학생 간, 교수-학생 간 화면 및 결과물 공유를 통해 상호 원활한 피드백을 지원하고 강의 흐름을 이어갈 수 있습니다.\n컨트롤러앱의 직관적인 UI와 원터치 버튼으로 누구나 편리하게 사용가능합니다.\n코딩 강의실은 코딩, 디자인, 미디 작곡 등 디지털 제작 수업에 특화된 고생산성 강의실입니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildFeature('통합 제어기능을 활용한 효율적인 강의 진행'),
                const SizedBox(height: 16),
                _buildFeature('실시간 코드 리뷰 및 피드백 시스템'),
                const SizedBox(height: 16),
                _buildFeature('원터치 화면 공유를 통한 즉각적인 학생 지원'),
                const SizedBox(height: 16),
                _buildFeature('과정·결과물 공유로 효과적인 협업 환경 제공'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      constraints: const BoxConstraints(maxWidth: 800),
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/img/coding.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '코딩(CODING) 강의실',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '실습과 협업이 자유로운 디지털 제작 특화 교육 공간',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '학생-학생 간, 교수-학생 간 화면 및 결과물 공유를 통해 상호 원활한 피드백을 지원하고 강의 흐름을 이어갈 수 있습니다.\n컨트롤러앱의 직관적인 UI와 원터치 버튼으로 누구나 편리하게 사용가능합니다.\n코딩 강의실은 코딩, 디자인, 미디 작곡 등 디지털 제작 수업에 특화된 고생산성 강의실입니다.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _buildFeature('통합 제어기능을 활용한 효율적인 강의 진행'),
              const SizedBox(height: 14),
              _buildFeature('실시간 코드 리뷰 및 피드백 시스템'),
              const SizedBox(height: 14),
              _buildFeature('원터치 화면 공유를 통한 즉각적인 학생 지원'),
              const SizedBox(height: 14),
              _buildFeature('과정·결과물 공유로 효과적인 협업 환경 제공'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/img/coding.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '코딩(CODING) 강의실',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '실습과 협업이 자유로운 디지털 제작 특화 교육 공간',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w600,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '학생-학생 간, 교수-학생 간 화면 및 결과물 공유를 통해 상호 원활한 피드백을 지원하고 강의 흐름을 이어갈 수 있습니다.\n컨트롤러앱의 직관적인 UI와 원터치 버튼으로 누구나 편리하게 사용가능합니다.\n코딩 강의실은 코딩, 디자인, 미디 작곡 등 디지털 제작 수업에 특화된 고생산성 강의실입니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildFeature('통합 제어기능을 활용한 효율적인 강의 진행'),
              const SizedBox(height: 12),
              _buildFeature('실시간 코드 리뷰 및 피드백 시스템'),
              const SizedBox(height: 12),
              _buildFeature('원터치 화면 공유를 통한 즉각적인 학생 지원'),
              const SizedBox(height: 12),
              _buildFeature('과정·결과물 공유로 효과적인 협업 환경 제공'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: PRIMARY_COLOR, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Paperlogy',
              color: PLAIN_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
