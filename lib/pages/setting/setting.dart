import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaoda/apis/user/auth.dart';
import 'package:miaoda/components/ink_item.dart';
import 'package:miaoda/components/section_card.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/dialog.dart';
import 'package:miaoda/utils/json_prefs.dart';
import 'package:miaoda/utils/toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "系统设置",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final _userStore = UserStore.use();

  // 清空缓存
  clearPrefs() {
    MDialog.of(context).show("清空缓存后需要重新登录", onConfirm: () async {
      await JsonPrefs.clear();
      MToast.of(context).message("操作成功", type: MToastType.success);
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  // 退出登录
  logout() {
    MDialog.of(context).show("确定要退出登录吗", onConfirm: () async {
      try {
        await AuthApi.logout();
        await _userStore.setToken(null);
        await _userStore.setUserInfo(null);
      } catch (err) {
        MToast.of(context).message("操作失败", type: MToastType.error);
        rethrow;
      }
      MToast.of(context).message("操作成功", type: MToastType.success);
      Navigator.of(context).pushReplacementNamed("login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            const SizedBox(height: 16),
            const Text("个人信息"),
            const SizedBox(height: 6),
            buildPersonInfo(),
            const SizedBox(height: 16),
            const Text("通用"),
            const SizedBox(height: 6),
            buildGeneral(),
            const SizedBox(height: 16),
            const Text("其他"),
            const SizedBox(height: 6),
            buildOther(),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  // 个人信息
  Widget buildPersonInfo() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSettingItem(label: "修改资料", onTap: () {}),
          divider(),
          buildSettingItem(label: "账号设置", onTap: () {}),
          divider(),
          buildSettingItem(label: "消息设置", onTap: () {}),
          divider(),
          buildSettingItem(label: "实名认证", onTap: () {}),
        ],
      ),
    );
  }

  // 通用
  Widget buildGeneral() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSettingItem(label: "推送通知设置", onTap: () {}),
          divider(),
          buildSettingItem(label: "帮助与反馈", onTap: () {}),
          divider(),
          buildSettingItem(label: "关于渺答", onTap: () {}),
        ],
      ),
    );
  }

  // 其他
  Widget buildOther() {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSettingItem(
            label: "退出登录",
            center: true,
            onTap: logout,
            textStyle: const TextStyle(
              color: CupertinoColors.destructiveRed,
              fontSize: 15,
            ),
          ),
          divider(),
          buildSettingItem(
            label: "清空缓存",
            center: true,
            onTap: clearPrefs,
            textStyle: const TextStyle(
              color: CupertinoColors.activeBlue,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return const Divider(height: 0, color: CupertinoColors.systemGrey5);
  }

  Widget buildSettingItem({
    Function()? onTap,
    required String label,
    bool? center,
    TextStyle? textStyle,
  }) {
    return InkItem(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            textAlign: center == true ? TextAlign.center : null,
            style: textStyle ?? const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
