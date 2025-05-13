import 'package:company_home/common/index.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StudioEach extends StatelessWidget {
  const StudioEach({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildMobile(context),
      tablet: (context) => _buildTablet(context),
      desktop: (context) => _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            _StudioItem(
              title: '1인 스튜디오',
              content: '최소한의 오퍼레이팅만으로 강의를 진행하고 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_one.webp',
              isDesktop: true,
            ),
            _StudioItem(
              title: '블랙 스튜디오',
              content: '무게감 있는 블랙 배경을 통해, 자막을 강조하고 집중도 있는 교육 콘텐츠 제작에 유용한 스튜디오',
              imgPath: 'assets/img/studio_black.webp',
              isDesktop: true,
            ),
            _StudioItem(
              title: '화이트 스튜디오',
              content: '피사체에 균일한 광량을 제공, 강의자에게 초점을 맞춘 고품질 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_white.webp',
              isDesktop: true,
            ),
            _StudioItem(
              title: '크로마키 스튜디오',
              content: '가상 배경 합성을 통해 다채로운 교육 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_chroma.webp',
              isDesktop: true,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            _StudioItem(
              title: '1인 스튜디오',
              content: '최소한의 오퍼레이팅만으로 강의를 진행하고 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_one.webp',
              isTablet: true,
            ),
            _StudioItem(
              title: '블랙 스튜디오',
              content: '무게감 있는 블랙 배경을 통해, 자막을 강조하고 집중도 있는 교육 콘텐츠 제작에 유용한 스튜디오',
              imgPath: 'assets/img/studio_black.webp',
              isTablet: true,
            ),
            _StudioItem(
              title: '화이트 스튜디오',
              content: '피사체에 균일한 광량을 제공, 강의자에게 초점을 맞춘 고품질 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_white.webp',
              isTablet: true,
            ),
            _StudioItem(
              title: '크로마키 스튜디오',
              content: '가상 배경 합성을 통해 다채로운 교육 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_chroma.webp',
              isTablet: true,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            _StudioItem(
              title: '1인 스튜디오',
              content: '최소한의 오퍼레이팅만으로 강의를 진행하고 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_one.webp',
              isMobile: true,
            ),
            _StudioItem(
              title: '블랙 스튜디오',
              content: '무게감 있는 블랙 배경을 통해, 자막을 강조하고 집중도 있는 교육 콘텐츠 제작에 유용한 스튜디오',
              imgPath: 'assets/img/studio_black.webp',
              isMobile: true,
            ),
            _StudioItem(
              title: '화이트 스튜디오',
              content: '피사체에 균일한 광량을 제공, 강의자에게 초점을 맞춘 고품질 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_white.webp',
              isMobile: true,
            ),
            _StudioItem(
              title: '크로마키 스튜디오',
              content: '가상 배경 합성을 통해 다채로운 교육 콘텐츠를 제작할 수 있는 스튜디오',
              imgPath: 'assets/img/studio_chroma.webp',
              isMobile: true,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class _StudioItem extends StatelessWidget {
  final String title;
  final String content;
  final String imgPath;
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const _StudioItem({
    required this.title,
    required this.content,
    required this.imgPath,
    this.isDesktop = false,
    this.isTablet = false,
    this.isMobile = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imgPath, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Paperlogy',
                color: PLAIN_COLOR,
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Paperlogy',
                color: PLAIN_COLOR,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 20 : 40,
        vertical: isTablet ? 24 : 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imgPath, width: isTablet ? 350 : 450),
          SizedBox(width: isTablet ? 24 : 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 20 : 22,
                    fontFamily: 'Paperlogy',
                    color: PLAIN_COLOR,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isTablet ? 8 : 12),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 18,
                    fontFamily: 'Paperlogy',
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
