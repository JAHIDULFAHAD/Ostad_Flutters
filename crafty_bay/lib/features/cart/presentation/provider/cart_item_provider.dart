import 'package:flutter/cupertino.dart';

import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/cart_item_model.dart';

class CartListProvider extends ChangeNotifier {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? errorMessage;

  final List<CartItemModel> _cartList = [];
  List<CartItemModel> get cartList => _cartList;

  Future<void> getCartList() async {
    _inProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.cartItemList,
    );

    if (response.isSuccess) {
      _cartList.clear();

      final List results = response.responseData['data']['results'];

      for (var item in results) {
        _cartList.add(CartItemModel.fromJson(item));
      }
    } else {
      errorMessage = response.errorMessage;
    }

    _inProgress = false;
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;
    for (var item in _cartList) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
