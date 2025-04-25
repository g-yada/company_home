import 'package:flutter/widgets.dart';

/// 화면의 너비를 체크, 해당 너비에 적합한 뷰를 설정하기 위한 기준 판단
/// (모바일, 태블릿, 데스크탑)

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
}
