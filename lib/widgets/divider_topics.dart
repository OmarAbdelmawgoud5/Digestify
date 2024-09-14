import 'package:flutter/material.dart';

class DividerTopics extends StatelessWidget {
  const DividerTopics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Divider(
        indent: 20,
        endIndent: 20,
        height: 6,
        thickness: .7,
      ),
    );
  }
}
