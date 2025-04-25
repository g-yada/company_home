import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:company_home/widgets/layout/responsive.dart';

/// 홈페이지 상단 내비게이션바
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ? MobileNav() : DesktopNav();

    /// isMobile => MobileNav : 로고 + 햄버거 버튼
    /// !isMobile => DesktopNav : 로고 + 메뉴 텍스트 전체
  }
}

/// 모바일이 아닌 화면일 때 보여줄 내비게이션바
class DesktopNav extends StatelessWidget {
  const DesktopNav({super.key});

  @override
  Widget build(BuildContext context) {
    const navBarHeight = 80.0;

    return PreferredSize(
      preferredSize: const Size.fromHeight(navBarHeight),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        height: navBarHeight,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: Image.asset('assets/img/logo_gg.png', width: 120),

                /// 회사 로고 이미지
              ),
            ),
            Row(
              children: [
                const _NavItem(label: '핵심역량', path: '/'),
                const SizedBox(width: 38),
                const _NavItem(
                  label: '사업분야',
                  path: '/business/studio',
                  submenuItems: ['스튜디오', '첨단강의실', '복합학습공간', '지역혁신플랫폼'],
                ),
                const SizedBox(width: 38),
                const _NavItem(label: '고객지원', path: '/service'),
                const SizedBox(width: 38),
                const _NavItem(
                  label: '회사소개',
                  path: '/about',
                  submenuItems: ['회사개요', '포트폴리오', '오시는길'],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 모바일 화면일 때 보여줄 내비게이션바
class MobileNav extends StatelessWidget {
  const MobileNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/// _NavItem = 메뉴 텍스트들 : Hover 효과, 서브메뉴 출력
class _NavItem extends StatefulWidget {
  final String label;
  final String path;
  final List<String>? submenuItems;

  const _NavItem({required this.label, required this.path, this.submenuItems});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final hasSubMenu =
        widget.submenuItems != null && widget.submenuItems!.isNotEmpty;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: SizedBox(
        height: 80 + (hasSubMenu && isHovering ? 200 : 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => context.go(widget.path),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Paperlogy',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 2,
                      width: isHovering ? 60 : 0,
                      color: Color(0xFFD4373C),
                      margin: const EdgeInsets.only(top: 4),
                    ),
                  ],
                ),
              ),
            ),
            if (hasSubMenu && isHovering)
              Positioned(
                top: 60,
                left: 0,
                child: Material(
                  elevation: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          widget.submenuItems!
                              .map(
                                (item) => GestureDetector(
                                  onTap: () {
                                    context.go('${widget.path}/$item');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Paperlogy',
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
