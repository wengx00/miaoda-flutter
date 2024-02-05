import 'package:flutter/material.dart';
import 'package:miaoda/store/user/user.dart';

class InfoDataRow extends StatelessWidget {
  InfoDataRow({super.key});

  final _userStore = UserStore.use();
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildDataRowItem(label: "关注", num: _userStore.userStatistic?.followCount ?? 0),
        buildDataRowItem(label: "粉丝", num: _userStore.userStatistic?.fanCount ?? 0),
        buildDataRowItem(label: "动态", num: _userStore.userStatistic?.postCount ?? 0),
        buildDataRowItem(label: "获赞", num: _userStore.userStatistic?.raisedCount ?? 0),
      ],
    );
  }

  // 数据栏项目
  Widget buildDataRowItem({required String label, required int num}) {
    return Column(
      children: [
        Text(
          "$num",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}