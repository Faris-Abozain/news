import 'package:flutter/material.dart';
import 'package:news/moduels/core/AppColors/app_colors.dart';
import 'package:news/moduels/models/category.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key,required this.onButtonClick});

  final List<Category> categoriesList = Category.getCategoriesList();
  Function onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good Morning\nHere is Some News For You",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              final category = categoriesList[index];
              final isEven = index % 2 == 0;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[300],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          category.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Title
                      Align(
                        alignment:
                        isEven ? Alignment.bottomRight : Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 140),
                          child: Text(
                            category.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment:
                        isEven ? Alignment.bottomRight : Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              onButtonClick(categoriesList[index]);
                            },
                            child: Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                color: AppColors.black.withOpacity(.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 12),
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
