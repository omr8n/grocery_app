import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/widgets/back_widget.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/providers/viewed_prod_provider.dart';
// import 'package:grocery_app/widgets/back_widget.dart';
// import 'package:grocery_app/widgets/empty_screen.dart';
import 'package:provider/provider.dart';

// import '../../services/global_methods.dart';
// import '../../services/utils.dart';
// import '../../widgets/text_widget.dart';
import '../../../core/helper/functions/global_methods.dart';
import '../../../core/widgets/empty_screen.dart';
import 'viewed_widget.dart';

class ViewedRecentlyView extends StatefulWidget {
  const ViewedRecentlyView({super.key});
  static const routeName = '/ViewedRecentlyScreen';
  @override
  State<ViewedRecentlyView> createState() => _ViewedRecentlyViewState();
}

class _ViewedRecentlyViewState extends State<ViewedRecentlyView> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    // final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    // final viewedProdItemsList = viewedProdProvider.getViewedProdlistItems.values
    //     .toList()
    //     .reversed
    //     .toList();
    // if (viewedProdItemsList.isEmpty) {
    //   return const EmptyScreen(
    //     title: 'Your history is empty',
    //     subtitle: 'No products has been viewed yet!',
    //     buttonText: 'Shop now',
    //     imagePath: 'assets/images/history.png',
    //   );
    // } else {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.warningDialog(
                title: 'Empty your history?',
                subtitle: 'Are you sure?',
                fct: () {},
                context: context,
              );
            },
            icon: Icon(IconlyBroken.delete),
          ),
        ],
        leading: const BackWidget(),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: 'History', fontSize: 24.0),
        backgroundColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withOpacity(0.9),
      ),
      body: ListView.builder(
        // itemCount: viewedProdItemsList.length,
        itemCount: 12,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: ViewedRecentlyItem(),
            // child: ChangeNotifierProvider.value(
            //     value: viewedProdItemsList[index],
            //     child: ViewedRecentlyWidget()),
          );
        },
      ),
    );
  }
}

// }
