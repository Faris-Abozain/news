import 'package:flutter/material.dart';
import 'package:news/moduels/models/source_response.dart';

class SourceTabName extends StatelessWidget {
  Source source;
  bool isSelected;
   SourceTabName({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name??"",
      style:  TextStyle(
        fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white
      ),
    );
  }
}
