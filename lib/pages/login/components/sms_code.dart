import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miaoda/pages/login/shared/data.dart';

class SmsCode extends StatefulWidget {
  const SmsCode({super.key});

  @override
  State<SmsCode> createState() => _SmsCodeState();
}

class _SmsCodeState extends State<SmsCode> {
  final _sharedData = DataStore.use();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 验证码输入监听
    _controller.addListener(() {
      _sharedData.setLoginForm(code: _controller.text);
    });
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 验证码框点击
  onCodeViewTap() {
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        codeInput(),
        GestureDetector(
          onTap: onCodeViewTap,
          child: codeView(),
        ),
      ],
    );
  }

  Widget codeInput() {
    return SizedBox(
      width: 0,
      height: 0,
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        enableInteractiveSelection: false, // 禁用长按复制
        focusNode: _focusNode,
        maxLength: _sharedData.codeLength,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("^[0-9]*\$"),
              allow: true), // 只允许输入数字
        ],
      ),
    );
  }

  Widget codeView() {
    return GridView.count(
      crossAxisCount: _sharedData.codeLength,
      crossAxisSpacing: 10,
      childAspectRatio: 0.95,
      shrinkWrap: true, // Important
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        _sharedData.codeLength,
        (index) => Observer(
          builder: (context) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[100]!,
                border: index == _sharedData.code.length
                    ? Border.all(
                        width: 2,
                        color: Colors.blue,
                      )
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: _sharedData.code.length <= index
                ? null
                : Text(
                    _sharedData.code[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
          ),
        ),
      ).toList(),
    );
  }
}
