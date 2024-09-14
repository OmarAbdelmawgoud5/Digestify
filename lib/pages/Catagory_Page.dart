import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';


class Catagory extends StatelessWidget {
  const Catagory(
      {super.key,
      required this.catagoryName,
      required this.catagoryId,
      required this.isSection});
  final String catagoryName;
  final String catagoryId;
  final bool isSection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        title: Text(
          catagoryName,
          overflow:TextOverflow.ellipsis ,
          style: TextStyle(

            color:isSection? Colors.blue:Colors.red,
            fontSize: 24,
            fontFamily: "meta",
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
        NewsTileListViewBuilder(
            section: isSection ? catagoryId : null,
            tag: isSection ? null : catagoryId),
      ]),
    );
  }
}
