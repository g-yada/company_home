import 'package:company_home/widgets/index.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: Color(0xFF3D3F3D),
      width: double.infinity,
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '(주)엠디케이',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Paperlogy',
                    fontSize: 16,
                  ),
                ),
                Text(
                  '대표이사: 강동은\n전화번호: 051-508-9975\n사업자등록번호: 404-86-02368\n주소: [46206] 부산광역시 금정구 체육공원로 555\n\nCopyrightⓒ (주)엠디케이. All Rights Reserved.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(width: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/logo_bw.png', width: 120),
                SizedBox(height: 30),
                WhiteButton(buttonName: '상담/문의하기', path: '/service'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
