import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../../../core/utils/utils.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key,
      required this.catText,
      required this.imgPath,
      required this.color});
  final String catText, imgPath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);

    Size size = utils.getScreenSize;
    // final themeState = Provider.of<DarkThemeProvider>(context);
    //  double _screenWidth = MediaQuery.of(context).size.width;
    // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, CategoryScreen.routeName,
        //     arguments: catText);
      },
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(children: [
          // Container for the image
          Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          // Category name
          CustomText(
            text: catText,
            fontSize: 20,
            isTitle: true,
          ),
        ]),
      ),
    );
  }
}
