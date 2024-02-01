// 主题卡片
import 'package:flutter/material.dart';
import 'package:miaoda/main.dart';
import 'package:miaoda/pages/index/components/topic_item.dart';
import 'package:miaoda/pages/index/models/topic.dart';
import 'package:miaoda/utils/tools.dart';

class TopicView extends StatelessWidget {
  final TopicViewModel model;
  final void Function()? onTap;
  final void Function(int)? onItemTap;

  const TopicView({super.key, required this.model, this.onTap, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Tools.randomColor(r: 100, seed: 50),
              Colors.white,
              Colors.white
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              model.title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "${model.hot}热度值",
              style: const TextStyle(
                  fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            ...model.items.mapIndexed(
              (item, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: TopicViewItem(model: item, onTap: () {
                  if (onItemTap != null) onItemTap!(index);
                },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
