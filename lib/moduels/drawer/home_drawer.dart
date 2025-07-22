import 'package:flutter/material.dart';

import '../core/AppColors/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerMenuClick;
  HomeDrawer({super.key, required this.onDrawerMenuClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white),
            child: Center(
                child: Text(
              "News App",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.home_outlined,
                  color: AppColors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      onDrawerMenuClick();
                    },
                    child: const Text(
                      "Go To Home",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
          Divider(
            color: AppColors.white,
            endIndent: 30,
            indent: 30,
          )
        ],
      ),
    );
  }
}
