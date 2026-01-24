import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/urls.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsPrvider extends ChangeNotifier {
  bool _isProductDetailsLoading = true;
  bool get isProductDetailsLoading => _isProductDetailsLoading;

  ProductDetailsModel? _productDetailsModel;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _isProductDetailsLoading = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.productDetailsUrl(productId),
    );
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData['data']);
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _isProductDetailsLoading = false;
    notifyListeners();
    return isSuccess;
  }
}
