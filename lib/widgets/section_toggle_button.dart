import 'package:flutter/material.dart';
import 'package:news_app/models/section_model.dart';


class SectionToggleButtonList extends StatefulWidget {
  const SectionToggleButtonList(
      {super.key, required this.sectionList, required this.selectedIndex});
  final List<SectionModel>? sectionList;
  final ValueNotifier<int> selectedIndex;
  @override
  State<SectionToggleButtonList> createState() => _SectionToggleButtonState();
}

class _SectionToggleButtonState extends State<SectionToggleButtonList> {
  @override
  void dispose() {
    
    super.dispose();
    //_selectedIndex.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemCount: widget.sectionList!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<int>(
            valueListenable: widget.selectedIndex,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minimumSize: const Size(0, 0),
                      backgroundColor: widget.selectedIndex.value == index
                          ? const Color.fromARGB(255, 17, 142, 245)
                          : const Color.fromARGB(185, 246, 246, 247),
                      foregroundColor: widget.selectedIndex.value == index
                          ? Colors.white
                          : Colors.black45),
                  onPressed: () {
                    widget.selectedIndex.value = index;
                    widget.selectedIndex.notifyListeners();
                  },
                  child: Text(widget.sectionList![index].sectionName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
