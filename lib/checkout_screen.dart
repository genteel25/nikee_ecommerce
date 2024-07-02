import 'package:flutter/material.dart';

import 'state_management/cart/state.dart';
import 'styles/colors.dart';
import 'styles/text_styles.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightFrameColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightFrameColor,
        title: Text(
          "Checkout",
          style: Styles.x28dp700w().copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.lightTextColor),
        ),
      ),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.lightBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information",
                    style: Styles.x28dp700w().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightTextColor),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF8F9FA),
                        ),
                        child: const Icon(Icons.mail_outline),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "genteelajagbe@gmail.com",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            Text(
                              "Email",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: AppColors.lightSubTextColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF8F9FA),
                        ),
                        child: const Icon(Icons.phone),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "09068974869",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            Text(
                              "Phone",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: AppColors.lightSubTextColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Address",
                    style: Styles.x28dp700w().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightTextColor),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF8F9FA),
                        ),
                        child: const Icon(Icons.location_on),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Iwo road, Ibadan",
                          style: Styles.x28dp700w().copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.edit_outlined,
                        color: AppColors.lightSubTextColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Payment Method",
                    style: Styles.x28dp700w().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightTextColor),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF8F9FA),
                        ),
                        child: const Icon(Icons.payment),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paypal Card",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightTextColor,
                              ),
                            ),
                            Text(
                              "**** **** 0696 4629",
                              style: Styles.x28dp700w().copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightSubTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Icon(
                      //   Icons.edit_outlined,
                      //   color: AppColors.lightSubTextColor,
                      // )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // SizedBox(height: 16),
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
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: Text(
                        "Payment",
                        style: Styles.x28dp700w().copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightBgColor,
                        ),
                      ),
                    ),
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
