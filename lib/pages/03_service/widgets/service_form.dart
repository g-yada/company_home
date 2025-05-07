import 'package:flutter/material.dart';
import 'package:company_home/widgets/index.dart';

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

  String? _category;
  String? _requestType;
  bool _agreePrivacy = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_category == null) {
        _showDialog("'구분'을 선택해 주세요");
        return;
      }
      if (_requestType == null) {
        _showDialog("'요청 종류'을 선택해 주세요");
        return;
      }
      if (!_agreePrivacy) {
        _showDialog('개인정보 수집 및 이용에 동의해주셔야 전송이 가능합니다.');
        return;
      }

      _showDialog('전송이 완료되었습니다.');
      _resetForm();
    }
  }

  void _resetForm() {
    setState(() {
      _emailController.clear();
      _titleController.clear();
      _contentController.clear();
      _category = null;
      _requestType = null;
      _agreePrivacy = false;
      _formKey.currentState!.reset();
    });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('알림'),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('확인'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formRow(
                '이메일 *',
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return '이메일을 입력해주세요.';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                      return '올바른 이메일 형식이 아닙니다.';
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _formRow(
                '구분 *',
                Wrap(
                  spacing: 12,
                  children:
                      ['정부/지자체', '학교/교육기관', '기업', '개인']
                          .map(
                            (label) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: label,
                                  groupValue: _category,
                                  onChanged:
                                      (value) =>
                                          setState(() => _category = value),
                                ),
                                Text(label),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 16),

              _formRow(
                '요청종류 *',
                Wrap(
                  spacing: 12,
                  children:
                      ['상담·문의', 'A/S요청', '기타요청']
                          .map(
                            (label) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  value: label,
                                  groupValue: _requestType,
                                  onChanged:
                                      (value) =>
                                          setState(() => _requestType = value),
                                ),
                                Text(label),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 16),

              _formRow(
                '제목',
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _formRow(
                '내용 *',
                TextFormField(
                  controller: _contentController,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.length < 10)
                      return '내용은 10자 이상 입력해주세요.';
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Divider(),
              CheckboxListTile(
                value: _agreePrivacy,
                onChanged:
                    (value) => setState(() => _agreePrivacy = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('위 내용에 동의합니다.'),
              ),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('작성 완료'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formRow(String label, Widget field) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 100, child: Text(label)),
        const SizedBox(width: 8),
        Expanded(child: field),
      ],
    );
  }
}
