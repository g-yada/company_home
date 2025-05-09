import 'package:company_home/common/index.dart';
import 'package:flutter/material.dart';

class StudioEach extends StatelessWidget {
  const StudioEach({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 18),

        _StudioItem(
          title: '1인 스튜디오',
          content: '최소한의 오퍼레이팅만으로 강의를 진행하고 콘텐츠를 제작할 수 있는 스튜디오',
          imgPath: 'assets/img/studio_one.webp',
        ),
        SizedBox(height: 18),
        _StudioItem(
          title: '블랙 스튜디오',
          content: '무게감 있는 블랙 배경을 통해, 자막을 강조하고 집중도 있는 교육 콘텐츠 제작에 유용한 스튜디오',
          imgPath: 'assets/img/studio_black.webp',
        ),
        _StudioItem(
          title: '화이트 스튜디오',
          content: '피사체에 균일한 광량을 제공, 강의자에게 초점을 맞춘 고품질 콘텐츠를 제작할 수 있는 스튜디오',
          imgPath: 'assets/img/studio_white.webp',
        ),
        _StudioItem(
          title: '크로마키 스튜디오',
          content: '가상 배경 합성을 통해 다채로운 교육 콘텐츠를 제작할 수 있는 스튜디오',
          imgPath: 'assets/img/studio_chroma.webp',
        ),
      ],
    );
  }
}

class _StudioItem extends StatelessWidget {
  final String title;
  final String content;
  final String imgPath;

  const _StudioItem({
    required this.title,
    required this.content,
    required this.imgPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        child: Row(
          children: [
            Image.asset(imgPath, width: 450),
            SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Paperlogy',
                    color: PLAIN_COLOR,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Paperlogy',
                    color: PLAIN_COLOR,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
