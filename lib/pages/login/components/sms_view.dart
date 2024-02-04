import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miaoda/pages/login/components/sms_code.dart';
import 'package:miaoda/pages/login/shared/data.dart';

class SmsView extends StatefulWidget {
  const SmsView({super.key});

  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  final _sharedData = DataStore.use();

  Function()? getResendHandler() {
    if (_sharedData.needToWait > 0) return null;
    return () {
      Navigator.of(context).pop(false);
    };
  }

  Function()? getForwardHandler() {
    if (_sharedData.code.length != _sharedData.codeLength) return null;
    return () {
      Navigator.of(context).pop(true);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "输入短信验证码",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "已向您的手机 ${_sharedData.phone} 发送验证码",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            SmsCode(),
            const SizedBox(height: 16),
            buildResendButton(), // 重新发送按钮
            const SizedBox(height: 64),
            buildForwardButton(), // 下一步按钮
          ],
        ),
      ),
    );
  }

  Widget buildResendButton() {
    return Observer(
      builder: (context) => GestureDetector(
        onTap: getResendHandler(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "重新发送${_sharedData.needToWait == 0 ? '' : '（${_sharedData.needToWait}s）'}",
              style: TextStyle(
                color: _sharedData.needToWait == 0
                    ? CupertinoColors.activeBlue
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForwardButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Observer(
        builder: (context) => OutlinedButton(
          onPressed: getForwardHandler(),
          style: OutlinedButton.styleFrom(
            foregroundColor: CupertinoColors.activeBlue,
            disabledForegroundColor: CupertinoColors.systemGrey,
            side: BorderSide(
              width: 1,
              color: _sharedData.code.length == _sharedData.codeLength
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          child: const Text("下一步"),
        ),
      ),
    );
  }
}
