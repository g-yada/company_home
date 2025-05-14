import 'package:flutter/material.dart';
import 'package:company_home/common/color.dart';
import 'package:company_home/pages/03_service/widgets/dialogs/service_completion_dialog.dart';

class ServiceConfirmDialog extends StatelessWidget {
  final String email;
  final VoidCallback onConfirm;

  const ServiceConfirmDialog({
    super.key,
    required this.email,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 400),
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
              child: Icon(Icons.mail_outline, color: PRIMARY_COLOR, size: 28),
            ),
            const SizedBox(height: 24),
            Text(
              '제출 확인',
              style: TextStyle(
                color: PLAIN_COLOR,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Paperlogy',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '작성하신 메일 주소는\n$email입니다.\n제출하시겠습니까?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PLAIN_COLOR,
                fontSize: 16,
                fontFamily: 'Paperlogy',
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder:
                          (_) => ServiceCompletionDialog(onConfirm: onConfirm),
                    );
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
                    '예',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: PLAIN_COLOR,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '아니오',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
