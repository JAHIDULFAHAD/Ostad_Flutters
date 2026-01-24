import 'package:flutter/cupertino.dart';

import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _isAddToCartInProgress = false;

  bool get isAddToCartInProgress => _isAddToCartInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String productId) async {
    bool isSuccess = false;
    _isAddToCartInProgress = true;
    notifyListeners();
    Map<String, dynamic> requestBody = {'product': productId};
    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.addToCartUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _isAddToCartInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
