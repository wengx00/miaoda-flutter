import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miaoda/apis/user/info.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';

class DynamicInfo extends StatefulWidget {
  const DynamicInfo({super.key});

  @override
  State<DynamicInfo> createState() => _DynamicInfoState();
}

class _DynamicInfoState extends State<DynamicInfo> {
  final _userStore = UserStore.use();

  double _nameMaxWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Observer(
        builder: (context) => buildInfoRow(),
      ),
    );
  }

  Widget buildInfoRow() {
    final userInfo = _userStore.userInfo;
    final rowWidth = MediaQuery.of(context).size.width - 48 - 74 - 12;
    return SizedBox(
      height: 74,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              // 头像
              buildAvatar(),
              const SizedBox(width: 12),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: rowWidth, maxHeight: 74),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: _nameMaxWidth),
                          child: Text(
                            userInfo == null ? '加载中..' : userInfo.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AfterLayout(
                          callback: (param) {
                            setState(() {
                              _nameMaxWidth = rowWidth - 8 - param.size.width;
                            });
                          },
                          child: buildLevelLabel(),
                        )
                      ],
                    ),
                    Text(
                      "华南师范大学 计算机学院 计算机科学与技术",
                      style: const TextStyle(
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          // 进入主页
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.chevron_right,
                color: CupertinoColors.systemGrey,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 头像
  Widget buildAvatar() {
    final userInfo = _userStore.userInfo;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Config.primaryColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1000))),
        child: Image.network(
          userInfo == null
              ? 'https://cravatar.cn/avatar/10a70e0a8ab352f6fc307e3587caaa7b'
              : userInfo.avatar,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // 等级标签
  Widget buildLevelLabel() {
    final userInfo = _userStore.userInfo;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Config.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(1000))),
      child: Text(
        "Lv.${userInfo == null ? 0 : 0}",
        style: const TextStyle(
            fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
