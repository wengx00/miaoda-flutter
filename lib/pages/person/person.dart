import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaoda/apis/user/info.dart';
import 'package:miaoda/components/pull_refresh.dart';
import 'package:miaoda/components/section_card.dart';
import 'package:miaoda/pages/person/components/dynamic_info.dart';
import 'package:miaoda/pages/person/components/toolbar_item.dart';
import 'package:miaoda/store/user/user.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              isLabelVisible: false,
              child: Icon(Icons.notifications_outlined),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PersonContent(),
      ),
    );
  }
}

class _ToolBarItem {
  String label;
  IconData icon;
  Function()? action;

  _ToolBarItem({required this.label, required this.icon, this.action});
}

class PersonContent extends StatefulWidget {
  const PersonContent({super.key});
  

  @override
  State<PersonContent> createState() => _PersonContentState();
}

class _PersonContentState extends State<PersonContent> {
  late List<_ToolBarItem> _toolBarItems;
  late List<List<_ToolBarItem>> _usefulFeatures;

  final _userStore = UserStore.use();

  // 前往系统设置
  _toSetting() {
    Navigator.of(context).pushNamed("setting");
  }

  // 更新UserInfo
  Future updateUserInfo() async {
    final userInfo = await InfoApi.get();
    await _userStore.setUserInfo(userInfo);
  }

  @override
  void initState() {
    super.initState();
    _toolBarItems = <_ToolBarItem>[
      _ToolBarItem(label: "我的提问", icon: Icons.edit, action: () {}),
      _ToolBarItem(label: "我的课程", icon: Icons.book, action: () {}),
      _ToolBarItem(label: "我的收藏", icon: Icons.star, action: () {}),
      _ToolBarItem(
          label: "历史记录", icon: CupertinoIcons.clock_fill, action: () {}),
    ];
    _usefulFeatures = <List<_ToolBarItem>>[
      [
        _ToolBarItem(label: "我的消息", icon: Icons.sms_outlined, action: () {}),
        _ToolBarItem(label: "我的发帖", icon: Icons.content_copy, action: () {}),
        _ToolBarItem(label: "帮助反馈", icon: Icons.help_outline, action: () {}),
        _ToolBarItem(
            label: "系统设置", icon: Icons.settings_outlined, action: _toSetting),
      ]
    ];
    _contents = [
      const DynamicInfo(),
      const SizedBox(height: 32),
      buildToolBar(),
      const SizedBox(height: 16),
      buildUsefulFeature(),
    ];
    if (_userStore.userInfo == null) updateUserInfo();
  }

  List<Widget> _contents = [];

  // 工具栏
  Widget buildToolBar() {
    return SectionCard(
      title: const Text(
        "个人中心",
        style: TextStyle(fontSize: 14),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _toolBarItems
            .map((e) => ToolbarItem(
                  label: e.label,
                  icon: e.icon,
                  onTap: e.action,
                ))
            .toList(),
      ),
    );
  }

  // 常用功能
  Widget buildUsefulFeature() {
    return SectionCard(
      title: const Text(
        "常用功能",
        style: TextStyle(fontSize: 14),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _usefulFeatures
            .map(
              (e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: e
                    .map((e) => ToolbarItem(
                          label: e.label,
                          icon: e.icon,
                          onTap: e.action,
                        ))
                    .toList(),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MPullRefreshScope(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          slivers: [
            MSliverPullRefreshIndicator(
              refreshTriggerPullDistance: 100,
              refreshIndicatorExtent: 60,
              onRefresh: updateUserInfo,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _contents[index],
                childCount: _contents.length,
              ),
            ),
          ],
        ),
      );
  }
}
