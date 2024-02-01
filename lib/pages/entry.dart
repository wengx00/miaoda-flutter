import 'package:flutter/material.dart';
import 'package:miaoda/components/icon_label.dart';
import 'package:miaoda/main.dart';
import 'package:miaoda/pages/index/index.dart';
import 'package:miaoda/pages/topic.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<StatefulWidget> createState() => _EntryPageState();
}

class TabBarItem {
  IconData icon;
  String label;

  TabBarItem({required this.icon, required this.label});
}

class _EntryPageState extends State<EntryPage> {
  final _userStore = UserStore.use();

  final tabBarItems = <TabBarItem>[
    TabBarItem(icon: Icons.home, label: "首页"),
    TabBarItem(icon: Icons.forum, label: "主题"),
    TabBarItem(icon: Icons.public, label: "星球"),
    TabBarItem(icon: Icons.person, label: "我的"),
  ];

  final tabBarHeight = 60.0;
  final _controller = PageController(initialPage: 0);
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Config.primaryColor,
          onPressed: () {},
          elevation: 3,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.grey,
        shape: const CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        height: tabBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: getTabBarItems(),
        ),
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          IndexPage(),
          TopicPage(),
          IndexPage(),
          IndexPage(),
        ],
      ),
    );
  }

  List<Widget> getTabBarItems() {
    final items = <Widget>[
      ...tabBarItems.mapIndexed((e, i) => IconLabel(
            label: e.label,
            icon: e.icon,
            selected: i == _pageIndex,
            onTap: () {
              setState(() {
                _pageIndex = i;
              });
              _controller.jumpToPage(i);
            },
          )),
    ];
    items.insert(2, const SizedBox(width: 0));
    return items;
  }
}
