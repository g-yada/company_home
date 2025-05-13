import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:company_home/common/color.dart';

class SmartClassPbl extends StatelessWidget {
  const SmartClassPbl({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PBL 강의실',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w700,
                    color: PRIMARY_COLOR,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  '문제 기반 학습(Problem Based Learning)을 위한 최적의 강의 공간',
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
                  '그룹별로 화면과 아이디어를 공유하고, 필요에 따라 자유롭게 공간을 재구성할 수 있는 가변형 강의실입니다.\n교수자가 주도하는 일방적 수업에서 벗어나 학습자 간 협력과 토론을 통해 창조적이고 자기주도적인 학습이 가능하도록 지원합니다.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildFeature('모둘형 책상과 의자로 자유로운 그룹 구성'),
                const SizedBox(height: 16),
                _buildFeature('그룹별 디스플레이로 효율적인 협업 가능'),
                const SizedBox(height: 16),
                _buildFeature('상호 연동되는 화면 공유 시스템'),
                const SizedBox(height: 16),
                _buildFeature('IoT 기반 환경 제어로 쾌적한 학습 환경 유지'),
              ],
            ),
          ),
          const SizedBox(width: 60),
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
                  image: AssetImage('assets/img/pbl.webp'),
                  fit: BoxFit.cover,
                ),
              ),
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
                image: AssetImage('assets/img/pbl.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PBL 강의실',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '문제 기반 학습(Problem Based Learning)을 위한 최적의 강의 공간',
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
                '그룹별로 화면과 아이디어를 공유하고, 필요에 따라 자유롭게 공간을 재구성할 수 있는 가변형 강의실입니다.\n교수자가 주도하는 일방적 수업에서 벗어나 학습자 간 협력과 토론을 통해 창조적이고 자기주도적인 학습이 가능하도록 지원합니다.',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _buildFeature('모둘형 책상과 의자로 자유로운 그룹 구성'),
              const SizedBox(height: 14),
              _buildFeature('그룹별 디스플레이로 효율적인 협업 가능'),
              const SizedBox(height: 14),
              _buildFeature('상호 연동되는 화면 공유 시스템'),
              const SizedBox(height: 14),
              _buildFeature('IoT 기반 환경 제어로 쾌적한 학습 환경 유지'),
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
                image: AssetImage('assets/img/pbl.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PBL 강의실',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '문제 기반 학습(Problem Based Learning)을 위한 최적의 강의 공간',
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
                '그룹별로 화면과 아이디어를 공유하고, 필요에 따라 자유롭게 공간을 재구성할 수 있는 가변형 강의실입니다.\n교수자가 주도하는 일방적 수업에서 벗어나 학습자 간 협력과 토론을 통해 창조적이고 자기주도적인 학습이 가능하도록 지원합니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w400,
                  color: PLAIN_COLOR,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              _buildFeature('모둘형 책상과 의자로 자유로운 그룹 구성'),
              const SizedBox(height: 12),
              _buildFeature('그룹별 디스플레이로 효율적인 협업 가능'),
              const SizedBox(height: 12),
              _buildFeature('상호 연동되는 화면 공유 시스템'),
              const SizedBox(height: 12),
              _buildFeature('IoT 기반 환경 제어로 쾌적한 학습 환경 유지'),
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
