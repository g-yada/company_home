import 'package:flutter/material.dart';
import 'package:company_home/common/color.dart';
import 'package:company_home/pages/03_service/widgets/dialogs/service_confirm_dialog.dart';
import 'package:company_home/pages/03_service/widgets/send_email.dart';

/// [상담 및 문의 폼]

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _nameController = TextEditingController();

  String? _category;
  String? _requestType;
  bool _agreePrivacy = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_category == null) {
        _showErrorDialog("'구분'을 선택해 주세요");
        return;
      }
      if (_requestType == null) {
        _showErrorDialog("'요청 종류'을 선택해 주세요");
        return;
      }
      if (!_agreePrivacy) {
        _showErrorDialog('개인정보 수집 및 이용에 동의해주셔야 전송이 가능합니다.');
        return;
      }

      await sendEmail(
        fromEmail: _emailController.text,
        forWhat: _requestType!,
        category: _category!,
        name:
            _nameController.text.trim().isEmpty
                ? '성명(기관명) 미기재'
                : _nameController.text.trim(),
        subject:
            _titleController.text.trim().isEmpty
                ? '제목 미기재'
                : _titleController.text.trim(),
        message: _contentController.text,
      );

      showDialog(
        context: context,
        builder:
            (_) => ServiceConfirmDialog(
              email: _emailController.text,
              onConfirm: _resetForm,
            ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _emailController.clear();
    _titleController.clear();
    _contentController.clear();
    _nameController.clear();

    setState(() {
      _category = null;
      _requestType = null;
      _agreePrivacy = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
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
                      Icons.error_outline,
                      color: PRIMARY_COLOR,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '알림',
                    style: TextStyle(
                      color: PLAIN_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: PLAIN_COLOR,
                      fontSize: 16,
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
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
          ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        padding: const EdgeInsets.all(32),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '상담/문의하기',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: PLAIN_COLOR,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Paperlogy',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '아래 서식에 따라 상담 또는 문의내용을 남겨주시면 3영업일 내 메일로 답변 드리겠습니다.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: PLAIN_COLOR,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Paperlogy',
                ),
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade200, thickness: 1),
              const SizedBox(height: 32),
              ServiceFormField(
                label: '이메일 *',
                field: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return '이메일을 입력해주세요.';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                      return '올바른 이메일 형식이 아닙니다.';
                    return null;
                  },
                  decoration: _getInputDecoration(),
                ),
              ),
              const SizedBox(height: 24),
              ServiceFormField(
                label: '구분 *',
                field: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children:
                      ['정부/지자체', '학교/교육기관', '기업', '개인']
                          .map(
                            (label) => _buildRadioOption(
                              label,
                              _category,
                              (value) => setState(() => _category = value),
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 24),
              ServiceFormField(
                label: '요청종류 *',
                field: Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children:
                      ['상담·문의', 'AS요청', '기타요청']
                          .map(
                            (label) => _buildRadioOption(
                              label,
                              _requestType,
                              (value) => setState(() => _requestType = value),
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 24),
              ServiceFormField(
                label: '성명(기관명)',
                field: TextFormField(
                  controller: _nameController,
                  decoration: _getInputDecoration(),
                ),
              ),
              const SizedBox(height: 24),
              ServiceFormField(
                label: '제목',
                field: TextFormField(
                  controller: _titleController,
                  decoration: _getInputDecoration(),
                ),
              ),
              const SizedBox(height: 24),
              ServiceFormField(
                label: '내용 *',
                field: TextFormField(
                  controller: _contentController,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.length < 10)
                      return '내용은 10자 이상 입력해주세요.';
                    return null;
                  },
                  decoration: _getInputDecoration(),
                ),
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.grey.shade200, thickness: 1),
              const SizedBox(height: 16),
              CheckboxListTile(
                value: _agreePrivacy,
                onChanged:
                    (value) => setState(() => _agreePrivacy = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('위 내용에 동의합니다.'),
                activeColor: PRIMARY_COLOR,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    '작성 완료',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Paperlogy',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: PRIMARY_COLOR),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  Widget _buildRadioOption(
    String label,
    String? groupValue,
    ValueChanged<String?> onChanged,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: PRIMARY_COLOR,
        ),
        Text(
          label,
          style: TextStyle(
            color: PLAIN_COLOR,
            fontFamily: 'Paperlogy',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ServiceFormField extends StatelessWidget {
  final String label;
  final Widget field;

  const ServiceFormField({super.key, required this.label, required this.field});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: RichText(
            text: TextSpan(
              children:
                  label.split('*').asMap().entries.map((entry) {
                    if (entry.key == 0) {
                      return TextSpan(
                        text: entry.value,
                        style: TextStyle(
                          color: PLAIN_COLOR,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Paperlogy',
                          fontSize: 16,
                        ),
                      );
                    } else {
                      return TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Paperlogy',
                          fontSize: 16,
                        ),
                      );
                    }
                  }).toList(),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: field),
      ],
    );
  }
}
