import 'package:flutter/material.dart';
import 'package:news/moduels/Home/category_fragment.dart';
import 'package:news/moduels/core/AppColors/app_colors.dart';
import 'package:news/moduels/drawer/home_drawer.dart';

import '../models/category.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          actions: [
            Icon(
              Icons.search,
              color: AppColors.white,
            )
          ],
          backgroundColor: AppColors.black,
          title: Text(
            "Home",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.black,
        drawer: HomeDrawer(onDrawerMenuClick:  onDrawerMenuClick,),
        body: selectedCategory == null?
        CategoryFragment(onButtonClick: onCategoryClick)
            : DetailsScreen(
                category: selectedCategory!,
              ));
  }

  Category? selectedCategory;
  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerMenuClick() {
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
