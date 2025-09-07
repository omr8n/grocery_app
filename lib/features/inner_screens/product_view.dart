import 'package:flutter/material.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import 'package:grocery_app/features/home/presentation/views/widgets/product_item.dart';

import '../../core/utils/utils.dart';
import '../../core/widgets/back_widget.dart';

class ProductsView extends StatefulWidget {
  static const routeName = "/FeedsScreenState";
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final TextEditingController? searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // final productsProvider =
    //     Provider.of<ProductsProvider>(context, listen: false);
    // productsProvider.fetchProducts();
    super.initState();
  }

  //List<ProductModel> listProdcutSearch = [];
  @override
  Widget build(BuildContext context) {
    bool isEmbty = false;
    Size size = Utils(context).getScreenSize;
    //final productsProvider = Provider.of<ProductsProvider>(context);
    // List<ProductModel> allProducts = productsProvider.getProducts;
    return Scaffold(
      appBar: AppBar(
        leading: const BackWidget(),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: CustomText(text: 'All Products', fontSize: 20.0, isTitle: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: searchTextController,
                  onChanged: (valuee) {
                    setState(() {
                      //    listProdcutSearch = productsProvider.searchQuery(valuee);
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    hintText: "What's in your mind",
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        searchTextController!.clear();
                        _searchTextFocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close,
                        color: _searchTextFocusNode.hasFocus
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // _searchTextController!.text.isNotEmpty && listProdcutSearch.isEmpty
            // isEmbty
            //     ? const EmptyProdWidget(
            //         text: 'No products found, please try another keyword',
            //       )
            //     :
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              // crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.58),
              children: List.generate(
                // _searchTextController!.text.isNotEmpty
                //     ? listProdcutSearch.length
                //     : allProducts.length, (index) {
                //  return ChangeNotifierProvider.value(
                // value: _searchTextController!.text.isNotEmpty
                //     ? listProdcutSearch[index]
                //     : allProducts[index],
                // child: const FeedsWidget(),
                //   );
                23,
                (index) {
                  return ProductItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
