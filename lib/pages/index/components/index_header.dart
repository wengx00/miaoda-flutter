import 'package:flutter/material.dart';

class IndexHeader extends StatefulWidget {
  const IndexHeader({super.key});

  @override
  State<IndexHeader> createState() => _IndexHeaderState();
}

class _IndexHeaderState extends State<IndexHeader> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
      // decoration: const BoxDecoration(
      //   color: Config.primaryColor,
      // ),
      child: TextField(
        controller: _controller,
        decoration: const InputDecoration(
            hintText: "搜索主题",
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 0, minWidth: 36),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            isCollapsed: true),
      ),
    );
  }
}