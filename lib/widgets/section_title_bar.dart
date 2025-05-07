import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:company_home/common/color.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;
  final String selectedSub;

  const SectionTitle({
    required this.sectionTitle,
    required this.selectedSub,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/sub_bg.webp'),
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.5),
            ),
          ),
          child: Center(
            child: Text(
              sectionTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: 'Paperlogy',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
        _SubNavBar(
          subList:
              sectionTitle == '사업분야'
                  ? ['스튜디오', '첨단강의실', '복합학습공간', '지역혁신플랫폼']
                  : ['회사개요', '포트폴리오', '오시는길'],
          selectedItem: selectedSub,
        ),
      ],
    );
  }
}

class _SubNavBar extends StatefulWidget {
  final List<String> subList;
  final String selectedItem;

  const _SubNavBar({
    required this.subList,
    required this.selectedItem,
    super.key,
  });

  @override
  State<_SubNavBar> createState() => _SubNavBarState();
}

class _SubNavBarState extends State<_SubNavBar> {
  String? hoveredItem;

  @override
  Widget build(BuildContext context) {
    const barHeight = 50.0;

    return Container(
      height: barHeight,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
            widget.subList.map((item) {
              final isSelected = item == widget.selectedItem;
              final isHovered = item == hoveredItem;
              final isActive = isSelected || isHovered;

              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    hoveredItem = item;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoveredItem = null;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    final path = _getPathForItem(item);
                    context.go(path);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: isActive ? PRIMARY_COLOR : Colors.transparent,
                    ),
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontFamily: 'Paperlogy',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isActive ? Colors.white : PLAIN_COLOR,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  String _getPathForItem(String item) {
    switch (item) {
      case '스튜디오':
        return '/business/studio';
      case '첨단강의실':
        return '/business/smartclass';
      case '복합학습공간':
        return '/business/hybrid';
      case '지역혁신플랫폼':
        return '/business/platform';
      case '회사개요':
        return '/about';
      case '포트폴리오':
        return '/about/portfolio';
      case '오시는길':
        return '/about/contact';
      default:
        return '/';
    }
  }
}
