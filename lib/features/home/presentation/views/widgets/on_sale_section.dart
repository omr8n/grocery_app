// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';
// // import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view_builder.dart';

// import '../../../../../core/helper/functions/global_methods.dart';
// // import '../../../../../core/utils/utils.dart';
// import '../../../../../core/widgets/custom_text.dart';
// import '../../../../inner_screens/on_sale_view.dart';
// // import 'on_sale_item.dart';

// class OnSaleSection extends StatelessWidget {
//   const OnSaleSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextButton(
//           onPressed: () {
//             GlobalMethods.navigateTo(
//               ctx: context,
//               routeName: OnSaleView.routeName,
//             );
//           },
//           child: const CustomText(
//             text: "View All",
//             color: Colors.blue,
//             fontSize: 15,
//             isTitle: false,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Row(
//           children: [
//             RotatedBox(
//               quarterTurns: -1,
//               child: Row(
//                 children: [
//                   CustomText(
//                     text: 'On sale'.toUpperCase(),
//                     color: Colors.red,
//                     fontSize: 22,
//                   ),
//                   const SizedBox(width: 5),
//                   const Icon(IconlyLight.discount, color: Colors.red),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8),
//             Flexible(child: OnSaleListViewBuilder(child: OnSaleListView(products: ),)),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view.dart';
import 'package:grocery_app/features/home/presentation/views/widgets/on_sale_list_view_builder.dart';
import '../../../../../core/helper/functions/global_methods.dart';
import '../../../../inner_screens/on_sale_view.dart';

class OnSaleSection extends StatelessWidget {
  const OnSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            GlobalMethods.navigateTo(
              ctx: context,
              routeName: OnSaleView.routeName,
            );
          },
          child: const CustomText(
            text: "View All",
            color: Colors.blue,
            fontSize: 15,
            isTitle: false,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Row(
                children: [
                  CustomText(
                    text: 'On sale'.toUpperCase(),
                    color: Colors.red,
                    fontSize: 22,
                  ),
                  const SizedBox(width: 5),
                  const Icon(IconlyLight.discount, color: Colors.red),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: OnSaleListViewBuilder(
                builder: (products) => OnSaleListView(products: products),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
