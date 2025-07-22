import 'package:flutter/material.dart';
import 'package:news/moduels/Home/news_widget.dart';
import 'package:news/moduels/core/AppColors/app_colors.dart';
import 'package:news/moduels/models/source_response.dart';
import 'package:news/moduels/models/source_tab_name.dart';


class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;


  SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.white,
              tabAlignment:TabAlignment.start ,
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourcesList.map((toElement) {
                return SourceTabName(
                  isSelected: selectedIndex == widget.sourcesList.indexOf(toElement),
                  source: toElement,
                );
              }).toList(),
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
