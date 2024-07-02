import 'package:ecommerce/checkout_screen.dart';
import 'package:flutter/material.dart';

import 'model/products.dart';
import 'state_management/cart/state.dart';
import 'styles/colors.dart';
import 'styles/text_styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightFrameColor,
      appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: AppColors.lightFrameColor,
        leadingWidth: 64,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.lightBgColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: Styles.x28dp700w().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.lightTextColor),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 24),
            ValueListenableBuilder(
                valueListenable: CartNotifier.instance.state,
                builder: (context, state, child) {
                  return switch (state) {
                    CartSuccessfulState(:List<CartData> cartData) => Expanded(
                        child: cartData.isEmpty
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 80),
                                  child: Text(
                                    "Cart is Empty at the moment",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightSubTextColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Row(
                                      children: [
                                        Container(
                                          width: 87,
                                          height: 87,
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: AppColors.lightBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Image.asset(
                                            "assets/images/${cartData[index].product.asset}.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        SizedBox(
                                          height: 87,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartData[index].product.name,
                                                style: Styles.x28dp700w()
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .lightTextColor),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "\$${cartData[index].product.price}",
                                                style:
                                                    Styles.x28dp700w().copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColors.lightTextColor,
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => CartNotifier
                                                        .instance
                                                        .decrementCartValue(
                                                            cartData[index]
                                                                .product),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .lightBgColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Text(
                                                    cartData[index]
                                                        .count
                                                        .toString(),
                                                    style: Styles.x28dp700w()
                                                        .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .lightTextColor,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  GestureDetector(
                                                    onTap: () => CartNotifier
                                                        .instance
                                                        .incrementCartValue(
                                                            cartData[index]
                                                                .product),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 14,
                                                        color: AppColors
                                                            .lightBgColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: 87,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("L"),
                                              GestureDetector(
                                                onTap: () => CartNotifier
                                                    .instance
                                                    .removeCartData(
                                                        cartData[index]
                                                            .product),
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: AppColors
                                                      .lightSubTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 30),
                                itemCount: cartData.length),
                      ),
                    _ => const Center(
                        child: Text("Nothing in cart"),
                      ),
                  };
                }),
            const SizedBox(height: 48),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.lightBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: Styles.x28dp700w().copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightSubTextColor,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: CartNotifier.instance.state,
                          builder: (context, state, child) {
                            return switch (state) {
                              CartSuccessfulState(:String totalAmount) => Text(
                                  "\$$totalAmount",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              _ => Text(
                                  "\$0",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                            };
                          }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: Styles.x28dp700w().copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightSubTextColor,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: CartNotifier.instance.state,
                          builder: (context, state, child) {
                            return switch (state) {
                              CartSuccessfulState(:String shippingFee) => Text(
                                  "\$$shippingFee",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              _ => Text(
                                  "\$0",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                            };
                          }),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost",
                        style: Styles.x28dp700w().copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightTextColor,
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: CartNotifier.instance.state,
                          builder: (context, state, child) {
                            return switch (state) {
                              CartSuccessfulState(:String mainAmount) => Text(
                                  "\$$mainAmount",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              _ => Text(
                                  "\$0",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                            };
                          }),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ValueListenableBuilder(
                        valueListenable: CartNotifier.instance.state,
                        builder: (context, state, child) {
                          return switch (state) {
                            CartSuccessfulState(:List<CartData> cartData) =>
                              ElevatedButton(
                                onPressed: cartData.isEmpty
                                    ? null
                                    : () {
                                        // CartNotifier.instance.checkoutCart();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CheckoutScreen(),
                                            ));
                                      },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor),
                                child: Text(
                                  "Checkout",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightBgColor,
                                  ),
                                ),
                              ),
                            _ => ElevatedButton(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor),
                                child: Text(
                                  "Checkout",
                                  style: Styles.x28dp700w().copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightBgColor,
                                  ),
                                ),
                              )
                          };
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
