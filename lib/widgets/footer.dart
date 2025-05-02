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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/img/logo.png', width: 100, height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '(주)엠디케이',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Paperlogy',
                  fontSize: 18,
                ),
              ),
              Text(
                '부산광역시 금정구 체육공원로 555',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          WhiteButton(buttonName: '상담/문의하기', path: '/service'),
        ],
      ),
    );
  }
}
