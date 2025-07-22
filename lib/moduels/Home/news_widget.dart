import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/moduels/models/news_item.dart';
import 'package:news/moduels/models/source_response.dart';

class NewsWidget extends StatefulWidget {
  Source source;
   NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getNews(widget.source.id??""),
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
                "Somthing Has Erorr",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: (){ ApiManger.getNews(widget.source.id??"");},
                  child: Text("Try Again",
                      style: TextStyle(fontSize: 16, color: Colors.black)))
            ],
          );
        }else if(snapshot.data?.status=="error"){
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              ElevatedButton(
                  onPressed:(){ ApiManger.getNews(widget.source.id??"");},

                  child: Text("Try Again",
                      style: TextStyle(fontSize: 16, color: Colors.black)))
            ],
          );

        }
        var newsList=snapshot.data!.articles!;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          },
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
        );
      },
    );
  }
}
