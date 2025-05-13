import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:company_home/common/color.dart';

class SmartClassHyflex extends StatelessWidget {
  const SmartClassHyflex({super.key});

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
                  image: AssetImage('assets/img/hyflex.webp'),
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
                  '하이플렉스(HYFLEX) 강의실',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '대면/비대면 수업을 동시에 진행할 수 있는 하이브리드 강의실',
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
                  '강의 녹화 시스템, 전자칠판, 태블릿, 영상·음향 장비, 소프트웨어 및 네트워크 설비를 추가하여, 온·오프라인 강의를 함께 진행할 수 있고 수업 자동 녹화 및 LMS 업로드를 지원합니다.\n강의실의 경계를 허물고 접근성을 높여 풍부한 학습 경험을 제공합니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildFeature('AI 트래킹 카메라로 강의자 자동 추적'),
                const SizedBox(height: 16),
                _buildFeature('고품질 마이크로 선명한 음성 전달'),
                const SizedBox(height: 16),
                _buildFeature('실시간 화면 공유 및 양방향 소통'),
                const SizedBox(height: 16),
                _buildFeature('자동 녹화/업로드 시스템 지원'),
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
                image: AssetImage('assets/img/hyflex.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '하이플렉스(HYFLEX) 강의실',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '대면/비대면 수업을 동시에 진행할 수 있는 하이브리드 강의실',
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
                '강의 녹화 시스템, 전자칠판, 태블릿, 영상·음향 장비, 소프트웨어 및 네트워크 설비를 추가하여, 온·오프라인 강의를 함께 진행할 수 있고 수업 자동 녹화 및 LMS 업로드를 지원합니다.\n강의실의 경계를 허물고 접근성을 높여 풍부한 학습 경험을 제공합니다.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _buildFeature('AI 트래킹 카메라로 강의자 자동 추적'),
              const SizedBox(height: 14),
              _buildFeature('고품질 마이크로 선명한 음성 전달'),
              const SizedBox(height: 14),
              _buildFeature('실시간 화면 공유 및 양방향 소통'),
              const SizedBox(height: 14),
              _buildFeature('자동 녹화/업로드 시스템 지원'),
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
                image: AssetImage('assets/img/hyflex.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '하이플렉스(HYFLEX) 강의실',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '대면/비대면 수업을 동시에 진행할 수 있는 하이브리드 강의실',
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
                '강의 녹화 시스템, 전자칠판, 태블릿, 영상·음향 장비, 소프트웨어 및 네트워크 설비를 추가하여, 온·오프라인 강의를 함께 진행할 수 있고 수업 자동 녹화 및 LMS 업로드를 지원합니다.\n강의실의 경계를 허물고 접근성을 높여 풍부한 학습 경험을 제공합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildFeature('AI 트래킹 카메라로 강의자 자동 추적'),
              const SizedBox(height: 12),
              _buildFeature('고품질 마이크로 선명한 음성 전달'),
              const SizedBox(height: 12),
              _buildFeature('실시간 화면 공유 및 양방향 소통'),
              const SizedBox(height: 12),
              _buildFeature('자동 녹화/업로드 시스템 지원'),
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
