import 'package:flutter/material.dart';

class ScrollService {
  static GlobalKey heroKey = GlobalKey(); // HeroSection의 위치를 지정하는 키
  static GlobalKey coreKey = GlobalKey(); // ContentSection의 위치를 지정하는 키

  // 강의실 섹션 키
  static GlobalKey hyflexKey = GlobalKey(); // 하이플렉스 강의실 섹션
  static GlobalKey pblKey = GlobalKey(); // PBL 강의실 섹션
  static GlobalKey codingKey = GlobalKey(); // 코딩 강의실 섹션
}
