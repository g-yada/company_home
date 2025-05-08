import 'package:flutter/material.dart';
import 'navbar.dart';

class AppLayout extends StatelessWidget {
  final List<Widget> children;
  final ScrollController? scrollController;

  const AppLayout({required this.children, this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MobileDrawer(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPersistentHeader(delegate: _NavbarDelegate(), pinned: true),
          SliverToBoxAdapter(child: Column(children: children)),
        ],
      ),
    );
  }
}

class _NavbarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 80.0;
  @override
  double get maxExtent => 80.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const Navbar();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

/// 각 섹션을 슬라이드 애니메이션으로 보여주는 위젯
class SlideInSection extends StatefulWidget {
  final List<Widget> children;
  final String? alignment;

  const SlideInSection({required this.children, this.alignment, super.key});

  @override
  State<SlideInSection> createState() => _SlideInSectionState();
}

class _SlideInSectionState extends State<SlideInSection>
    with SingleTickerProviderStateMixin {
  Offset offset = const Offset(0, -0.5);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        offset = const Offset(0, 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child:
          widget.children.isNotEmpty
              ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: switch (widget.alignment) {
                  'left' => CrossAxisAlignment.start,
                  'right' => CrossAxisAlignment.end,
                  'center' => CrossAxisAlignment.center,
                  _ => CrossAxisAlignment.center,
                },
                children: widget.children,
              )
              : const SizedBox.shrink(),
    );
  }
}
