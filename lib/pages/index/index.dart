import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaoda/pages/index/components/index_header.dart';
import 'package:miaoda/pages/index/components/topic_view.dart';
import 'package:miaoda/pages/index/models/topic.dart';
import 'package:miaoda/utils/config.dart';
import 'package:miaoda/utils/loading.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final topicModels = <TopicViewModel>[
    TopicViewModel(title: "计算机组成原理", hot: "3w+", items: <TopicItemModel>[
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
    ]),
    TopicViewModel(title: "计算机组成原理", hot: "3w+", items: <TopicItemModel>[
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
    ]),
    TopicViewModel(title: "计算机组成原理", hot: "3w+", items: <TopicItemModel>[
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
      TopicItemModel(
          title: "什么是并行计算",
          detail: "同时使用多个处理器，提高计算速度。算得飞快，无记名最喜欢考了。",
          like: "2.3w"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CupertinoColors.extraLightBackgroundGray),
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 0,
            automaticallyImplyLeading: false,
            title: IndexHeader(),
            surfaceTintColor: Colors.transparent,
            backgroundColor: CupertinoColors.extraLightBackgroundGray,
            titleSpacing: 0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TopicView(model: topicModels[index]),
                );
              },
              childCount: topicModels.length,
            ),
          )
        ],
      ),
    );
  }
}
