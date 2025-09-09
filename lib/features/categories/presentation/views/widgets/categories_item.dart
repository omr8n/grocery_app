// import 'package:flutter/material.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';

// import '../../../../../core/utils/utils.dart';

// class CategoriesItem extends StatelessWidget {
//   const CategoriesItem({
//     super.key,
//     required this.catText,
//     required this.imgPath,
//     required this.color,
//   });
//   final String catText, imgPath;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     final Utils utils = Utils(context);

//     Size size = utils.getScreenSize;
//     // final themeState = Provider.of<DarkThemeProvider>(context);
//     //  double _screenWidth = MediaQuery.of(context).size.width;
//     // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
//     return InkWell(
//       onTap: () {
//         // Navigator.pushNamed(context, CategoryScreen.routeName,
//         //     arguments: catText);
//       },
//       child: Container(
//         // height: _screenWidth * 0.6,
//         decoration: BoxDecoration(
//           // ignore: deprecated_member_use
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             // ignore: deprecated_member_use
//             color: color.withOpacity(0.7),
//             width: 2,
//           ),
//         ),
//         child: Column(
//           children: [
//             // Container for the image
//             Container(
//               height: size.width * 0.3,
//               width: size.width * 0.3,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(imgPath),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             // Category name
//             CustomText(text: catText, fontSize: 20, isTitle: true),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:grocery_app/core/models/category_model.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../inner_screens/product_view.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.color,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final size = utils.getScreenSize;

    final imgSize = size.width * 0.3;
    final borderColor = color.withOpacity(0.7);
    final bgColor = color.withOpacity(0.1);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductsView.routeName,
            arguments: categoryModel.name,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  categoryModel.image,
                  height: imgSize,
                  width: imgSize,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              CustomText(text: categoryModel.name, fontSize: 20, isTitle: true),
            ],
          ),
        ),
      ),
    );
  }
}
