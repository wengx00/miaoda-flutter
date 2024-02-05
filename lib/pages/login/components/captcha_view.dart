import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miaoda/apis/user/auth.dart';
import 'package:miaoda/model/user/vo/captcha.dart';
import 'package:miaoda/pages/login/components/forward_button.dart';
import 'package:miaoda/pages/login/shared/data.dart';
import 'package:shimmer/shimmer.dart';

class CaptchaView extends StatefulWidget {
  const CaptchaView({super.key, this.onForward});
  final void Function()? onForward;

  @override
  State<CaptchaView> createState() => _CaptchaViewState();
}

class _CaptchaViewState extends State<CaptchaView> {
  CaptchaVO? captchaVO;
  Widget? currentCaptcha;
  final _sharedData = DataStore.use();

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    currentCaptcha = null;
    setState(() {});
    captchaVO = await AuthApi.captcha();
    currentCaptcha = Container(
      width: 100,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: SvgPicture.string(
          String.fromCharCodes(base64Decode(captchaVO!.captcha.split(',')[1]))),
    );
    setState(() {});
  }

  void _forward() {
    if (_controller.text.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 16,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text("请输入4位图形验证码"),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        backgroundColor: CupertinoColors.activeOrange,
      ));
      return;
    }
    // 验证通过
    if (widget.onForward != null) {
      captchaVO!.captcha = _controller.text;
      _sharedData.setCaptchaVO(captchaVO);
      widget.onForward!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "人机验证",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: _controller,
                  decoration: const InputDecoration(
                      isCollapsed: true,
                      hintText: "图形验证码",
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 8)),
                ),
              ),
              const SizedBox(width: 20),
              currentCaptcha != null
                  ? GestureDetector(
                      onTap: _initialize,
                      child: currentCaptcha!,
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 4),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 4),
              Text(
                "不区分大小写",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ForwardButton(
                onTap: _forward,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
