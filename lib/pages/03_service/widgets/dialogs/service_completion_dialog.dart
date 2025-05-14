import 'package:flutter/material.dart';
import 'package:company_home/common/color.dart';

class ServiceCompletionDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const ServiceCompletionDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PRIMARY_COLOR.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline,
                color: PRIMARY_COLOR,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '제출 완료',
              style: TextStyle(
                color: PLAIN_COLOR,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Paperlogy',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '요청하신 상담/문의가 접수되었습니다.\n확인 후 메일로 답변드리겠습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PLAIN_COLOR,
                fontSize: 16,
                fontFamily: 'Paperlogy',
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              style: TextButton.styleFrom(
                backgroundColor: PRIMARY_COLOR,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                '확인',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Paperlogy',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
