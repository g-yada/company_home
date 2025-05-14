import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendEmail({
  required String fromEmail,
  required String forWhat,
  required String category,
  String? name,
  String? subject,
  required String message,
}) async {
  /// EmailJs 서비스아이디 / 템플릿아이디 / 퍼블릭키
  const serviceId = 'service_mdk';
  const templateId = 'template_mdkmail';
  const userId = 'AdEYXA11M_SqUCNUB';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final response = await http.post(
    url,
    headers: {
      'origin': 'http://localhost', // 추후 배포 시 수정 필요? 어차피 확인 안한다고 함
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'from_email': fromEmail,
        'for_what': forWhat,
        'category': category,
        'name': name,
        'subject': subject,
        'message': message,
      },
    }),
  );

  if (response.statusCode == 200) {
    print('이메일 전송 성공');
  } else {
    print('이메일 전송 실패: ${response.body}');
  }
}
