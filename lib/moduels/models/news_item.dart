
import 'package:flutter/material.dart';
import 'package:news/moduels/core/AppColors/app_colors.dart';

import 'news_response.dart';

class NewsItem extends StatelessWidget {
  News news;
   NewsItem({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 245,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2,color: AppColors.white),
        color: Colors.transparent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child:Image.network(news.urlToImage??""),),
            SizedBox(height: 10,),
            Text(news.title??"",maxLines: 1,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: AppColors.white),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("by :${news.author}",style: TextStyle(fontSize: 12,color: Colors.grey)),
                Spacer(),
                Text(news.publishedAt!.substring(0,10),style: TextStyle(fontSize: 12,color:Colors.grey))
              ],
            )
          ],
        ),
      ),
    );
  }
}
