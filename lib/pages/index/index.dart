import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaoda/pages/index/components/index_header.dart';
import 'package:miaoda/pages/index/components/topic_view.dart';
import 'package:miaoda/pages/index/models/topic.dart';
import 'package:miaoda/utils/config.dart';

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
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text(
          "渺答星球",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Config.primaryColor,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            title: IndexHeader(),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Config.primaryColor,
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
