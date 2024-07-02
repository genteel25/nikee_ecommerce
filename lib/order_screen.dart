import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

import 'styles/colors.dart';
import 'styles/text_styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.lightFrameColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: 44,
      //   backgroundColor: AppColors.lightFrameColor,
      //   // leadingWidth: 64,
      //   // leading: Column(
      //   //   mainAxisAlignment: MainAxisAlignment.center,
      //   //   children: [
      //   //     GestureDetector(
      //   //       onTap: () => Navigator.pop(context),
      //   //       child: Container(
      //   //         alignment: Alignment.center,
      //   //         margin: const EdgeInsets.only(left: 20),
      //   //         padding: const EdgeInsets.all(10),
      //   //         decoration: BoxDecoration(
      //   //           color: AppColors.lightBgColor,
      //   //           borderRadius: BorderRadius.circular(100),
      //   //         ),
      //   //         child: const Icon(Icons.arrow_back_ios),
      //   //       ),
      //   //     ),
      //   //   ],
      //   // ),
      //   centerTitle: true,
      //   title: Text(
      //     "My Orders",
      //     style: Styles.x28dp700w().copyWith(
      //         fontSize: 24,
      //         fontWeight: FontWeight.w500,
      //         color: AppColors.lightTextColor),
      //   ),
      // ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Image.asset("assets/images/order_success.png"),
            ),
            const SizedBox(height: 16),
            Text(
              "Congratulations!!!",
              style: Styles.x28dp700w().copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightTextColor),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                "Your order has been placed successfully",
                style: Styles.x28dp700w().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightSubTextColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  )),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor
                  // side:
                  //     const BorderSide(color: AppColors.primaryColor, width: 1.3),

                  ),
              child: Text(
                "Back To Shopping",
                style: Styles.x28dp700w().copyWith(
                    color: AppColors.lightBgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
