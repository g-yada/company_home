import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:company_home/common/index.dart';

/// 홈페이지 상단 내비게이션바
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(desktop: 800, tablet: 600, watch: 0),
      mobile: (context) => MobileNav(),
      desktop: (context) => DesktopNav(),
    );
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
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  context.go('/');

                  Future.delayed(const Duration(milliseconds: 300), () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      final targetContext =
                          ScrollService.heroKey.currentContext;
                      if (targetContext != null) {
                        Scrollable.ensureVisible(
                          targetContext,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  });
                }, // 로고 누르면 홈으로 이동
                child: Image.asset('assets/img/logo.png', width: 120),

                /// 회사 로고 이미지
              ),
            ),
            Row(
              children: [
                _NavItem(
                  label: '핵심역량',
                  onTap: () {
                    context.go('/');

                    Future.delayed(const Duration(milliseconds: 300), () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        final targetContext =
                            ScrollService.coreKey.currentContext;
                        if (targetContext != null) {
                          Scrollable.ensureVisible(
                            targetContext,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      });
                    });
                  },
                ),
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

/// 모바일이 아닌 화면일 때 : _NavItem = 메뉴 텍스트들 : Hover 효과, 서브메뉴 출력
class _NavItem extends StatefulWidget {
  final String label;
  final String? path;
  final VoidCallback? onTap;
  final List<String>? submenuItems;

  const _NavItem({
    required this.label,
    this.path,
    this.onTap,
    this.submenuItems,
  });

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
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!();
                  } else if (widget.path != null) {
                    context.go(widget.path!);
                  }
                },
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

/// 모바일 화면일 때 보여줄 내비게이션바
class MobileNav extends StatelessWidget {
  const MobileNav({super.key});

  @override
  Widget build(BuildContext context) {
    const navBarHeight = 100.0;

    return AppBar(
      toolbarHeight: navBarHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 150,
      leading: GestureDetector(
        onTap: () {
          context.go('/');

          Future.delayed(const Duration(milliseconds: 300), () {
            final targetContext = ScrollService.heroKey.currentContext;
            if (targetContext != null) {
              Scrollable.ensureVisible(
                targetContext,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          });
        }, // 로고 누르면 홈으로 이동
        child: Row(
          children: [
            const SizedBox(width: 30),
            Image.asset('assets/img/logo.png', width: 100),
          ],
        ),
      ),
      actions: [
        Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer(); // 햄버거 버튼 누르면 drawer 열기
                },
              ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}

/// 모바일 화면일 때 햄버거 버튼을 눌렀을 때 나오는 Drawer
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 70,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFD4373C)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '메뉴',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 열려있는 drawer를 닫아줌
                    },
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              '홈',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              context.go('/');

              Future.delayed(const Duration(milliseconds: 300), () {
                final targetContext = ScrollService.heroKey.currentContext;
                if (targetContext != null) {
                  Scrollable.ensureVisible(
                    targetContext,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              '핵심역량',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              context.go('/');

              Future.delayed(const Duration(milliseconds: 300), () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final targetContext = ScrollService.coreKey.currentContext;
                  if (targetContext != null) {
                    Scrollable.ensureVisible(
                      targetContext,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              });
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: const Text(
              '사업분야',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            children: [
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '스튜디오',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/business/studio');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '첨단강의실',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/business/smartclass');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '복합학습공간',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/business/hybrid');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '지역혁신플랫폼',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/business/platform');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            title: const Text(
              '고객지원',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              context.go('/service');
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: const Text(
              '회사소개',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Paperlogy',
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            children: [
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '회사개요',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/about');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '포트폴리오',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/about/portfolio');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: const Color.fromARGB(255, 255, 240, 240),
                title: const Text(
                  '오시는길',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTap: () {
                  context.go('/about/contact');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 클래스로 떼려다가 맘.... 나중에 하자.
// class _ListTile extends StatelessWidget {
//   final String name;
//   final String path;

//   const _ListTile({required this.name, required this.path, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         name,
//         style: TextStyle(
//           fontSize: 16,
//           fontFamily: 'Paperlogy',
//           fontWeight: FontWeight.w500,
//           decoration: TextDecoration.none,
//         ),
//       ),
//       onTap: () {
//         context.go(path);
//         Navigator.pop(context);
//       },
//     );
//   }
// }
