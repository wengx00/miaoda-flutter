import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miaoda/apis/user/auth.dart';
import 'package:miaoda/model/user/dto/login_by_phone.dart';
import 'package:miaoda/model/user/dto/send_sms.dart';
import 'package:miaoda/pages/login/components/captcha_view.dart';
import 'package:miaoda/pages/login/components/forward_button.dart';
import 'package:miaoda/pages/login/components/sms_view.dart';
import 'package:miaoda/pages/login/shared/data.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';
import 'package:miaoda/utils/dialog.dart';
import 'package:miaoda/utils/loading.dart';
import 'package:miaoda/utils/toast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBody());
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _sharedData = DataStore.use();
  final _userStore = UserStore.use();

  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();
  final fToast = FToast();
  bool agree = false;
  String errorText = "";
  PersistentBottomSheetController<dynamic>? bottomSheet;

  @override
  void initState() {
    super.initState();
    fToast.init(context);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        validate();
      }
    });
    _phoneController.addListener(() {
      _sharedData.setLoginForm(phone: _phoneController.text);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _focusNode.dispose();
    _sharedData.dispose();
    super.dispose();
  }

  bool validate() {
    bool result = true;
    if (_phoneController.text.isEmpty) {
      errorText = "请输入手机号码";
      result = false;
    } else {
      errorText = "";
    }
    setState(() {});
    return result;
  }

  // 发送短信
  Future<bool> sendSMS() async {
    final value = _sharedData.captchaVO!;
    if (_sharedData.needToWait > 0) {
      MToast.of(context).message("请等待${_sharedData.needToWait}秒后重试");
      return false;
    }
    final hideLoading = MLoading.of(context).show();
    try {
      await AuthApi.sendSMS(SendSmsDTO(
        reqToken: value.reqToken,
        validCode: value.captcha,
        phone: _phoneController.text,
      ));
    } catch (err) {
      // ignore: use_build_context_synchronously
      MToast.of(context).message("短信验证码发送失败", type: MToastType.error);
      _sharedData.setLoginForm(code: '');
      return false;
    } finally {
      hideLoading();
    }
    MToast.of(context).message("短信验证码发送成功", type: MToastType.success);
    _sharedData.startTimer();
    return true;
  }

  // 执行登录
  doLogin() async {
    final hideLoading = MLoading.of(context).show();
    try {
      final loginInfo = await AuthApi.loginByPhone(
          LoginByPhoneDTO(code: _sharedData.code, phone: _sharedData.phone));
      // 更新全局Token状态
      await _userStore.setToken(loginInfo.token);
      // ignore: use_build_context_synchronously
      await MDialog.of(context).show(
        "Token: ${loginInfo.token}",
        title: "登录成功",
        cancelable: false,
        confirmColor: CupertinoColors.activeBlue,
      );
      Navigator.of(context).pushReplacementNamed("home");
    } finally {
      hideLoading();
    }
  }

  // 下一步
  void forward() async {
    final next = await Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => const SmsView()));
    if (next == true) {
      doLogin();
    } else {
      // 清空输入
      _sharedData.setLoginForm(code: '');
    }
  }

  // 图形验证码
  void popupValidCode(BuildContext context) {
    if (!validate()) {
      return;
    }
    if (!agree) {
      MToast.of(context)
          .message("请阅读并同意《服务协议》和《隐私政策》", type: MToastType.warning);
      return;
    }
    _focusNode.unfocus();
    if (_sharedData.needToWait > 0) {
      forward();
      return;
    }
    bottomSheet = Scaffold.of(context).showBottomSheet(
      (context) => BottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onClosing: () {},
        builder: (context) => CaptchaView(
          onForward: () async {
            if (_sharedData.captchaVO == null) return;
            // 关闭弹框
            if (bottomSheet != null) bottomSheet!.close();
            if (await sendSMS()) forward();
          },
        ),
        enableDrag: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.blue[200]!,
          Colors.purple[100]!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Text(
              "开启渺答之旅",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 3),
            const Text(
              "短信验证码登录",
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "未注册的手机验证后自动登录",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            buildPhoneInput(),
            const Text(
              "账号密码登录",
              style: TextStyle(color: Config.primaryColor),
            ),
            const Spacer(flex: 2),
            // 下一步
            ForwardButton(
              onTap: () {
                popupValidCode(context);
              },
            ),
            const Spacer(flex: 3),
            buildPrivacy(),
          ],
        ),
      ),
    );
  }

  // 手机号输入区
  Widget buildPhoneInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 16),
      child: TextField(
        controller: _phoneController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: errorText.isNotEmpty
                ? const BorderSide(
                    color: CupertinoColors.destructiveRed, width: 1)
                : BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "手机号",
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          errorText: errorText.isEmpty ? null : errorText,
        ),
        focusNode: _focusNode,
      ),
    );
  }

  // 隐私政策
  Widget buildPrivacy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          child: Transform.scale(
            scale: 0.7,
            child: Checkbox(
              value: agree,
              activeColor: CupertinoColors.activeBlue,
              onChanged: (checked) {
                setState(() {
                  agree = checked == true ? true : false;
                });
              },
            ),
          ),
        ),
        const Text(
          "我已阅读并同意",
          style: TextStyle(fontSize: 12),
        ),
        const Text(
          "《服务协议》",
          style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 12),
        ),
        const Text(
          "和",
          style: TextStyle(fontSize: 12),
        ),
        const Text(
          "《隐私政策》",
          style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 12),
        ),
      ],
    );
  }
}
