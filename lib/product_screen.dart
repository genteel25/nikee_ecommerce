import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'model/products.dart';
import 'state_management/cart/state.dart';
import 'styles/colors.dart';
import 'styles/text_styles.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: false,
        foregroundColor: AppColors.lightBgColor,
        surfaceTintColor: AppColors.lightBgColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Products",
          style: Styles.x28dp700w().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.lightTextColor),
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                )),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.shopping_bag,
                      color: AppColors.lightSubTextColor,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: ValueListenableBuilder(
                          valueListenable: CartNotifier.instance.state,
                          builder: (context, state, child) {
                            return switch (state) {
                              CartSuccessfulState(:List<CartData> cartData) =>
                                Text(
                                  cartData.length.toString(),
                                  style: const TextStyle(fontSize: 8),
                                ),
                              _ => Text(
                                  0.toString(),
                                  style: const TextStyle(fontSize: 8),
                                ),
                            };
                          }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) => ProductItemWidget(
          product: products.value[index],
        ),
        itemCount: products.value.length,
      ),
    );
  }
}

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, required this.product});
  final ProductData product;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  late final CartNotifier cartNotifier;
  @override
  void initState() {
    super.initState();
    cartNotifier = CartNotifier();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      // height: 300,
      padding: const EdgeInsets.only(top: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.lightBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 140,
            child: Image.asset(
              "assets/images/${widget.product.asset}.png",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "BEST SELLER",
                    style: Styles.x28dp700w().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.product.name,
                    style: Styles.x28dp700w().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.product.price}",
                        style: Styles.x28dp700w().copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: CartNotifier.instance.state,
                          builder: (context, state, child) {
                            return switch (state) {
                              CartSuccessfulState(:List<CartData> cartData) =>
                                GestureDetector(
                                  onTap: cartData.any((element) =>
                                          element.product == widget.product)
                                      ? () {}
                                      : () => CartNotifier.instance
                                          .addToCart(widget.product),
                                  child: Container(
                                    padding: const EdgeInsets.all(11.5),
                                    decoration: BoxDecoration(
                                        color: cartData.any((element) =>
                                                element.product ==
                                                widget.product)
                                            ? AppColors.lightSubTextColor
                                                .withOpacity(0.7)
                                            : AppColors.primaryColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                        )),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.lightBgColor,
                                      // size: 12.sp,
                                    ),
                                  ),
                                ),
                              _ => GestureDetector(
                                  onTap: () => CartNotifier.instance
                                      .addToCart(widget.product),
                                  child: Container(
                                    padding: const EdgeInsets.all(11.5),
                                    decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                        )),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.lightBgColor,
                                      // size: 12.sp,
                                    ),
                                  ),
                                ),
                            };
                          }),
                    ],
                  ),
                ],
              ),
            ),
          )
              // .alignAtCenterLeft().paddingOnly(left: 12),
              ),
        ],
      ),
    );
  }
}
