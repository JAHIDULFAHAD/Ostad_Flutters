import 'package:flutter/cupertino.dart';

import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/product_model.dart';

class ProductListByCategoryProvider extends ChangeNotifier {
  int _pageSize = 30;

  int _currentPage = 0;

  int? _lastPageNo;

  bool _isProductLoading = false;

  bool _isMoreProductLoading = false;

  final List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  bool get isProductLoading => _isProductLoading;
  bool get isMoreProductLoading => _isMoreProductLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductList(String categoryId) async {
    bool isSuccess = false;

    if (_currentPage == 0) {
      _productList.clear();
      _isProductLoading = true;
    } else if (_currentPage < _lastPageNo!) {
      _isMoreProductLoading = true;
    } else {
      return false;
    }
    notifyListeners();
    _currentPage++;

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.productsByCategoryUrl(_pageSize, _currentPage, categoryId),
    );
    if (response.isSuccess) {
      _lastPageNo ??= response.responseData['data']['last_page'];
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData
      in response.responseData['data']['results']) {
        list.add(ProductModel.fromJson(jsonData));
      }
      _productList.addAll(list);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    if (_isProductLoading) {
      _isProductLoading = false;
    } else {
      _isMoreProductLoading = false;
    }
    notifyListeners();
    return isSuccess;
  }

  Future<void> loadIntialProductList(String categoryId) async {
    _currentPage = 0;
    _lastPageNo = null;
    await getProductList(categoryId);
  }
}
