import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/moduels/models/source_response.dart';
import 'package:news/moduels/models/source_tab_widget.dart';

import '../models/category.dart';

class DetailsScreen extends StatefulWidget {
  Category category;

  DetailsScreen({super.key, required this.category});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManger.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                "Something Has Error",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  "Try Again",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          );
        } else if (snapshot.data?.status == "error") {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  "Try Again",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          );
        }
        return SourceTabWidget(sourcesList: snapshot.data!.sources!,);
      },
    );
  }
}
