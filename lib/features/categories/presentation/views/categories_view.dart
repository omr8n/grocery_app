import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/app_constants.dart';

import '../../../../core/utils/utils.dart';

import '../../../../core/widgets/custom_text.dart';
import 'widgets/categories_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    // final utils = Utils(context);
    //  Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CustomText(
          isTitle: true,
          text: 'Categories',
          fontSize: 24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10, // Vertical spacing
          mainAxisSpacing: 10, // Horizontal spacing
          children: List.generate(6, (index) {
            return CategoriesItem(
              catText: AppConstants.catInfo[index]['catText'],
              imgPath: AppConstants.catInfo[index]['imgPath'],
              color: AppConstants.gridColors[index],
            );
          }),
        ),
      ),
    );
  }
}
