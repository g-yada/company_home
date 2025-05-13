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
      breakpoints: ScreenBreakpoints(desktop: 900, tablet: 900, watch: 0),
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
              color: Colors.black.withValues(alpha: 230),
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
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
                },
                child: Image.asset('assets/img/logo.png', width: 120),
              ),
            ),
            Row(
              children: [
                DesktopNavItem(
                  label: '핵심역량',
                  onTap: () {
                    context.go('/');
                    Future.delayed(const Duration(milliseconds: 300), () {
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
                  },
                ),
                const SizedBox(width: 38),
                DesktopNavItem(
                  label: '사업분야',
                  onTap: () {
                    context.go('/business/studio');
                    Future.delayed(const Duration(milliseconds: 300), () {
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
                  },
                  items: [
                    NavMenuItem(label: '스튜디오', path: '/business/studio'),
                    NavMenuItem(label: '첨단강의실', path: '/business/smartclass'),
                    NavMenuItem(label: '복합학습공간', path: '/business/hybrid'),
                    NavMenuItem(label: '지역혁신플랫폼', path: '/business/platform'),
                  ],
                ),
                const SizedBox(width: 38),
                const DesktopNavItem(label: '고객지원', path: '/service'),
                const SizedBox(width: 38),
                DesktopNavItem(
                  label: '회사소개',
                  onTap: () {
                    context.go('/about');
                    Future.delayed(const Duration(milliseconds: 300), () {
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
                  },
                  items: [
                    NavMenuItem(label: '회사개요', path: '/about'),
                    NavMenuItem(label: '포트폴리오', path: '/about/portfolio'),
                    NavMenuItem(label: '오시는길', path: '/about/contact'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavMenuItem {
  final String label;
  final String path;

  const NavMenuItem({required this.label, required this.path});
}

class DesktopNavItem extends StatefulWidget {
  final String label;
  final String? path;
  final VoidCallback? onTap;
  final List<NavMenuItem>? items;

  const DesktopNavItem({
    required this.label,
    this.path,
    this.onTap,
    this.items,
    super.key,
  });

  @override
  State<DesktopNavItem> createState() => _DesktopNavItemState();
}

class _DesktopNavItemState extends State<DesktopNavItem> {
  final GlobalKey _menuKey = GlobalKey();
  bool _isHovered = false;
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay(BuildContext context) {
    _removeOverlay();

    if (widget.items == null || widget.items!.isEmpty) return;

    final RenderBox renderBox =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: position.dy + renderBox.size.height,
            left: position.dx,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Material(
                elevation: 4,
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                        widget.items!
                            .map(
                              (item) => _SubmenuItem(
                                item: item,
                                onTap: () {
                                  context.go(item.path);
                                  setState(() => _isHovered = false);
                                  _removeOverlay();
                                },
                              ),
                            )
                            .toList(),
                  ),
                ),
              ),
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: _menuKey,
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _showOverlay(context);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!_isHovered) {
            _removeOverlay();
          }
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          } else if (widget.path != null) {
            context.go(widget.path!);
          }
        },
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Paperlogy',
                  fontWeight: FontWeight.w700,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovered ? 60 : 0,
                margin: const EdgeInsets.only(top: 4),
                color: const Color(0xFFD4373C),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmenuItem extends StatefulWidget {
  final NavMenuItem item;
  final VoidCallback onTap;

  const _SubmenuItem({required this.item, required this.onTap});

  @override
  State<_SubmenuItem> createState() => _SubmenuItemState();
}

class _SubmenuItemState extends State<_SubmenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          color: isHovered ? Colors.grey.withOpacity(0.1) : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            widget.item.label,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Paperlogy',
              fontWeight: FontWeight.w500,
            ),
          ),
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
                title: const Text(
                  '   스튜디오',
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
                title: const Text(
                  '   첨단강의실',
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
                title: const Text(
                  '   복합학습공간',
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
                title: const Text(
                  '   지역혁신플랫폼',
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
                title: const Text(
                  '   회사개요',
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
                title: const Text(
                  '   포트폴리오',
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
                title: const Text(
                  '   오시는길',
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
