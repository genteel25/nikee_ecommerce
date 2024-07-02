// import 'dart:developer';

import 'dart:developer';

import 'package:ecommerce/model/products.dart';
import 'package:flutter/material.dart';

abstract class CartState {}

class CartLoadingState extends CartState {}

class CartSuccessfulState extends CartState {
  final List<CartData> cartData;
  final String totalAmount;
  final String shippingFee;
  final String mainAmount;

  CartSuccessfulState(
      this.cartData, this.totalAmount, this.shippingFee, this.mainAmount);
}

class CartErrorState extends CartState {
  final String errorMessage;

  CartErrorState(this.errorMessage);
}

var products = ValueNotifier<List<ProductData>>([
  ProductData(
    id: 1,
    asset: "red_shoe",
    name: "Nike Jordan",
    price: "150",
    shippingFee: "2",
  ),
  ProductData(id: 2, asset: "blue_shoe", name: "Nike Air Max", price: "200"),
  ProductData(
    id: 3,
    asset: "red_shoe",
    name: "Nike Fancy",
    price: "493",
    shippingFee: "5",
  ),
  ProductData(id: 4, asset: "blue_shoe", name: "Nike Premium", price: "160"),
  ProductData(
    id: 5,
    asset: "red_shoe",
    name: "Nike Medium",
    price: "493",
    shippingFee: '3',
  ),
  ProductData(id: 6, asset: "red_shoe", name: "Nike Fancy", price: "500"),
  ProductData(
    id: 7,
    asset: "blue_shoe",
    name: "Nike Premium",
    price: "330",
    shippingFee: '1',
  ),
  ProductData(id: 8, asset: "red_shoe", name: "Nike Medium", price: "250"),
]);

class CartNotifier {
  var state = ValueNotifier<CartState>(CartLoadingState());
  List<CartData> cart = [];
  static final CartNotifier instance =
      CartNotifier._internal(); // Private constructor
  factory CartNotifier() =>
      instance; // Factory constructor to return the instance

  CartNotifier._internal(); // Private
  int _totalCartAmount = 0;
  int get totalCartAmount => _totalCartAmount;
  int _shippingFeeAmount = 0;
  int get shippingFeeAmount => _shippingFeeAmount;
  int _mainCartAmount = 0;
  int get mainCartAmount => _mainCartAmount;
  void addToCart(ProductData data) {
    List<CartData> checkCart =
        cart.where((element) => element.product == data).toList();
    if (checkCart.isEmpty) {
      CartData newCart = CartData(product: data);
      cart.add(newCart);
      _totalCartAmount = _totalCartAmount + int.parse(data.price);
      _shippingFeeAmount = _shippingFeeAmount + int.parse(data.shippingFee);
      _mainCartAmount = _shippingFeeAmount + _totalCartAmount;
      state.value = CartSuccessfulState(cart, totalCartAmount.toString(),
          shippingFeeAmount.toString(), mainCartAmount.toString());
    }
    log("totalAmount: $totalCartAmount, shippingFee: $shippingFeeAmount, mainAmount: $mainCartAmount");
  }

  incrementCartValue(ProductData data) {
    List<CartData> checkCart =
        cart.where((element) => element.product == data).toList();
    if (checkCart.isNotEmpty) {
      checkCart.first.count++;
      _totalCartAmount = _totalCartAmount + int.parse(data.price);
      _shippingFeeAmount = _shippingFeeAmount + int.parse(data.shippingFee);
      _mainCartAmount = _shippingFeeAmount + _totalCartAmount;
      state.value = CartSuccessfulState(cart, totalCartAmount.toString(),
          shippingFeeAmount.toString(), mainCartAmount.toString());
    }
    log("totalAmount: $totalCartAmount, shippingFee: $shippingFeeAmount, mainAmount: $mainCartAmount");
  }

  decrementCartValue(ProductData data) {
    List<CartData> checkCart =
        cart.where((element) => element.product == data).toList();
    if (checkCart.first.count == 1) {
      cart.remove(checkCart.first);
      _totalCartAmount = _totalCartAmount - int.parse(data.price);
      _shippingFeeAmount = _shippingFeeAmount - int.parse(data.shippingFee);
      _mainCartAmount = _totalCartAmount + _shippingFeeAmount;
      state.value = CartSuccessfulState(cart, totalCartAmount.toString(),
          shippingFeeAmount.toString(), mainCartAmount.toString());
    } else {
      checkCart.first.count--;
      _totalCartAmount = _totalCartAmount - int.parse(data.price);
      _shippingFeeAmount = _shippingFeeAmount - int.parse(data.shippingFee);
      _mainCartAmount = _totalCartAmount + _shippingFeeAmount;
      state.value = CartSuccessfulState(cart, totalCartAmount.toString(),
          shippingFeeAmount.toString(), mainCartAmount.toString());
    }
    log("totalAmount: $totalCartAmount, shippingFee: $shippingFeeAmount, mainAmount: $mainCartAmount");
  }

  removeCartData(ProductData data) {
    List<CartData> checkCart =
        cart.where((element) => element.product == data).toList();
    if (checkCart.isNotEmpty) {
      cart.remove(checkCart.first);
      _totalCartAmount =
          _totalCartAmount - (int.parse(data.price) * checkCart.first.count);
      _shippingFeeAmount = _shippingFeeAmount -
          (int.parse(data.shippingFee) * checkCart.first.count);
      _mainCartAmount = _totalCartAmount + _shippingFeeAmount;
      state.value = CartSuccessfulState(cart, totalCartAmount.toString(),
          shippingFeeAmount.toString(), mainCartAmount.toString());
    }
  }
}
