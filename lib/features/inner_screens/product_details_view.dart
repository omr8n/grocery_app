// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery_app/core/entites/product_entity.dart';
// import 'package:grocery_app/core/widgets/add_to_button_details.dart';
// // import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:grocery_app/core/widgets/back_widget.dart';
// import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/core/widgets/heart_btn.dart';
// // import 'package:grocery_app/core/widgets/heart_btn.dart';
// import 'package:grocery_app/core/widgets/quantity_controller.dart';
// import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// // import 'package:grocery_app/features/cart/domain/entites/cart_item_entity.dart';
// // import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';

// // import 'package:provider/provider.dart';

// import '../../core/utils/utils.dart';
// // import '../../core/widgets/heart_btn.dart';

// class ProductDetailsView extends StatefulWidget {
//   static const routeName = '/ProductDetails';
//   // final CartItemEntity cartItemEntity;

//   const ProductDetailsView({
//     super.key,
//     required this.productEntity,
//     // required this.cartItemEntity,
//   });
//   final ProductEntity productEntity;
//   @override
//   State<ProductDetailsView> createState() => _ProductDetailsViewState();
// }

// class _ProductDetailsViewState extends State<ProductDetailsView> {
//   late TextEditingController _quantityTextController;

//   @override
//   void initState() {
//     super.initState();
//     _quantityTextController = TextEditingController(
//       text: "1",
//       //    text: widget.cartItemEntity.quantity.toString(),
//     );
//   }

//   @override
//   void dispose() {
//     _quantityTextController.dispose();
//     super.dispose();
//   }

//   void _updateQuantity(int newQuantity) {
//     if (newQuantity < 1) return;

//     // تحديث الكمية في CartCubit
//     //   context.read<CartCubit>().updateQuantity(
//     //   //  widget.cartItemEntity,
//     //  //   newQuantity,
//     //   );

//     // تحديث الـ TextField محليًا
//     _quantityTextController.text = newQuantity.toString();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utils(context).getScreenSize;
//     final int quantity = int.tryParse(_quantityTextController.text) ?? 1;
//     final double unitPrice =
//         widget.productEntity.isOnSale && widget.productEntity.salePrice != null
//         ? widget.productEntity.salePrice!
//         : widget.productEntity.price;

//     final double total = unitPrice * quantity;

//     return PopScope(
//       onPopInvokedWithResult: (didPop, result) {},
//       // onWillPop: () async {
//       //   // viewedProdProvider.addProductToHistory(productId: productId);
//       //   return true;
//       // },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackWidget(),
//           elevation: 0,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Flexible(
//               flex: 2,
//               child: FancyShimmerImage(
//                 imageUrl: widget.productEntity.imageUrl!,
//                 // imageUrl:
//                 //     "https://m.media-amazon.com/images/I/61dV53UuRVS.__AC_SX300_SY300_QL70_FMwebp_.jpg",
//                 boxFit: BoxFit.scaleDown,
//                 width: size.width,
//                 // height: screenHeight * .4,
//               ),
//             ),
//             Flexible(
//               flex: 3,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 20,
//                         left: 30,
//                         right: 30,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: CustomText(
//                               //  text: getCurrProduct.title,
//                               ////  text: "title",
//                               text: widget.productEntity.name,
//                               fontSize: 25,
//                               isTitle: true,
//                             ),
//                           ),
//                           HeartBottonWidget(
//                             size: 20,
//                             product: widget.productEntity,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CustomText(
//                             text:
//                                 '\$${widget.productEntity.price.toStringAsFixed(2)}',

//                             // text: '\$${324}',
//                             color: Colors.green,
//                             fontSize: 22,
//                             isTitle: true,
//                           ),
//                           CustomText(
//                             text: widget.productEntity.isPiece
//                                 ? '/Piece'
//                                 : '/Kg',

//                             // text: ' 34/Piece',
//                             fontSize: 12,
//                             isTitle: false,
//                           ),
//                           const SizedBox(width: 10),
//                           Visibility(
//                             visible: widget.productEntity.isOnSale
//                                 ? true
//                                 : false,
//                             // visible: getCurrProduct.isOnSale ? true : false,
//                             //  visible: true,
//                             child: Text(
//                               '\$${widget.productEntity.price.toStringAsFixed(2)}',
//                               // '\$2',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 decoration: TextDecoration.lineThrough,
//                               ),
//                             ),
//                           ),
//                           const Spacer(),
//                           Material(
//                             color: const Color.fromRGBO(63, 200, 101, 1),
//                             borderRadius: BorderRadius.circular(5),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 4,
//                                 horizontal: 8,
//                               ),

//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(5),
//                                 onTap: () {},
//                                 child: CustomText(
//                                   text: 'Free delivery',
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   isTitle: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         QuantityController(
//                           padding: 5,
//                           color: Colors.red,
//                           icon: CupertinoIcons.minus,
//                           onTap: () {
//                             int currentQuantity =
//                                 int.tryParse(_quantityTextController.text) ?? 1;
//                             if (currentQuantity > 1) {
//                               _updateQuantity(currentQuantity - 1);
//                             }
//                           },
//                         ),

//                         const SizedBox(width: 5),
//                         Flexible(
//                           flex: 1,
//                           child: TextField(
//                             controller: _quantityTextController,
//                             key: const ValueKey('quantity'),
//                             keyboardType: TextInputType.number,
//                             maxLines: 1,
//                             decoration: const InputDecoration(
//                               border: UnderlineInputBorder(),
//                             ),
//                             textAlign: TextAlign.center,
//                             cursorColor: Colors.green,
//                             enabled: true,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(
//                                 RegExp('[0-9]'),
//                               ),
//                             ],
//                             onChanged: (value) {
//                               setState(() {
//                                 if (value.isEmpty) {
//                                   _quantityTextController.text = '1';
//                                 } else {}
//                               });
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 5),
//                         QuantityController(
//                           padding: 5,
//                           color: Colors.green,
//                           icon: CupertinoIcons.plus,
//                           onTap: () {
//                             int currentQuantity =
//                                 int.tryParse(_quantityTextController.text) ?? 1;
//                             _updateQuantity(currentQuantity + 1);
//                           },
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 20,
//                         horizontal: 30,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).colorScheme.secondaryContainer,

//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText(
//                                   text: 'Total',
//                                   color: Colors.red.shade300,
//                                   fontSize: 20,
//                                   isTitle: true,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 FittedBox(
//                                   child: Row(
//                                     children: [
//                                       CustomText(
//                                         text: '\$${total.toStringAsFixed(2)}',
//                                         fontSize: 20,
//                                         isTitle: true,
//                                       ),
//                                       CustomText(
//                                         text: widget.productEntity.isPiece
//                                             ? '$quantity Piece'
//                                             : '$quantity Kg',
//                                         fontSize: 16,
//                                         isTitle: false,
//                                       ),

//                                       // CustomText(
//                                       //   text:
//                                       //       '${_quantityTextController.text}Kg',

//                                       //   // text: r"$1Kg",
//                                       //   fontSize: 16,
//                                       //   isTitle: false,
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Flexible(
//                             child: AddCartButtonDetails(
//                               productEntity: widget.productEntity,
//                               quantity:
//                                   int.tryParse(_quantityTextController.text) ??
//                                   1,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:grocery_app/core/widgets/add_to_button_details.dart';
import 'package:grocery_app/core/widgets/back_widget.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/core/widgets/heart_btn.dart';
import 'package:grocery_app/core/widgets/quantity_controller.dart';
import 'package:grocery_app/features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
import '../../core/utils/utils.dart';

class ProductDetailsView extends StatefulWidget {
  static const routeName = '/ProductDetails';
  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late TextEditingController _quantityTextController;
  // optional clamp limits
  final int _minQuantity = 1;
  final int _maxQuantity = 999;

  @override
  void initState() {
    super.initState();
    _quantityTextController = TextEditingController(text: '1');

    // Listener: كل ما تغير نص الـ TextField نعمل rebuild لعرض الـ total المحدث
    _quantityTextController.addListener(_onQuantityChanged);
  }

  void _onQuantityChanged() {
    // فقط نعيد بناء الواجهة ليتحدّث الـ total و زر الإضافة
    // لا نكتب controller.text هنا لتفادي حلقات التكرار
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _quantityTextController.removeListener(_onQuantityChanged);
    _quantityTextController.dispose();
    super.dispose();
  }

  void _updateQuantity(int newQuantity) {
    if (newQuantity < _minQuantity) newQuantity = _minQuantity;
    if (newQuantity > _maxQuantity) newQuantity = _maxQuantity;

    // نحدّث النص برمجياً — هذا سيُطلق الـ listener ويعمل rebuild
    _quantityTextController.text = newQuantity.toString();

    // ضع المؤشر في نهاية النص بعد التغيير
    _quantityTextController.selection = TextSelection.fromPosition(
      TextPosition(offset: _quantityTextController.text.length),
    );
  }

  int get _currentQuantity {
    final q = int.tryParse(_quantityTextController.text);
    if (q == null || q < _minQuantity) return _minQuantity;
    if (q > _maxQuantity) return _maxQuantity;
    return q;
  }

  double get _unitPrice {
    // استخدم salePrice لو موجود وعلى العرض، وإلا سعر المنتج العادي
    return (widget.productEntity.isOnSale &&
            widget.productEntity.salePrice != null)
        ? widget.productEntity.salePrice!
        : widget.productEntity.price;
  }

  double get _currentTotal => _unitPrice * _currentQuantity;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    //cartCubit not needed for product total calculation
    final quantity = _currentQuantity;
    final total = _currentTotal;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        appBar: AppBar(
          leading: BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: FancyShimmerImage(
                imageUrl: widget.productEntity.imageUrl ?? '',
                boxFit: BoxFit.scaleDown,
                width: size.width,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    // --- Title & Heart
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomText(
                              text: widget.productEntity.name,
                              fontSize: 25,
                              isTitle: true,
                            ),
                          ),
                          HeartBottonWidget(
                            size: 20,
                            product: widget.productEntity,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // --- Price row (uses salePrice if on sale)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          CustomText(
                            text:
                                widget.productEntity.isOnSale &&
                                    widget.productEntity.salePrice != null
                                ? '\$${widget.productEntity.salePrice!.toStringAsFixed(2)}'
                                : '\$${widget.productEntity.price.toStringAsFixed(2)}',
                            color: Colors.green,
                            fontSize: 22,
                            isTitle: true,
                          ),
                          CustomText(
                            text: widget.productEntity.isPiece
                                ? '/Piece'
                                : '/Kg',
                            fontSize: 12,
                            isTitle: false,
                          ),
                          const SizedBox(width: 10),
                          if (widget.productEntity.isOnSale &&
                              widget.productEntity.salePrice != null)
                            Text(
                              '\$${widget.productEntity.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // --- Quantity controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuantityController(
                          padding: 5,
                          color: Colors.red,
                          icon: CupertinoIcons.minus,
                          onTap: () {
                            final current = _currentQuantity;
                            if (current > _minQuantity)
                              _updateQuantity(current - 1);
                          },
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 80,
                          child: TextField(
                            controller: _quantityTextController,
                            key: const ValueKey('quantity'),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                              ),
                            ],
                            // لا نغيّر controller.text هنا — نكتفي بالـ listener
                            onSubmitted: (_) {
                              // عند الضغط على "done" يمكن تصحيح القيمة إذا لزم
                              if (_currentQuantity < _minQuantity)
                                _updateQuantity(_minQuantity);
                              if (_currentQuantity > _maxQuantity)
                                _updateQuantity(_maxQuantity);
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        QuantityController(
                          padding: 5,
                          color: Colors.green,
                          icon: CupertinoIcons.plus,
                          onTap: () {
                            final current = _currentQuantity;
                            if (current < _maxQuantity)
                              _updateQuantity(current + 1);
                          },
                        ),
                      ],
                    ),

                    const Spacer(),

                    // --- Bottom total + add to cart
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Total',
                                  color: Colors.red.shade300,
                                  fontSize: 20,
                                  isTitle: true,
                                ),
                                const SizedBox(height: 5),
                                FittedBox(
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: '\$${total.toStringAsFixed(2)}',
                                        fontSize: 20,
                                        isTitle: true,
                                      ),
                                      const SizedBox(width: 6),
                                      CustomText(
                                        text: widget.productEntity.isPiece
                                            ? '$quantity Piece'
                                            : '$quantity Kg',
                                        fontSize: 16,
                                        isTitle: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: AddCartButtonDetails(
                              productEntity: widget.productEntity,
                              quantity: quantity, // نمرر الكمية الحالية
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
