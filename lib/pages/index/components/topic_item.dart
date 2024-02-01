import 'package:flutter/material.dart';
import 'package:miaoda/pages/index/models/topic.dart';

class TopicViewItem extends StatelessWidget {
  final TopicItemModel model;
  final void Function()? onTap;

  const TopicViewItem({super.key, required this.model, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.grey[50],
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Text(
                  model.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  model.detail,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
