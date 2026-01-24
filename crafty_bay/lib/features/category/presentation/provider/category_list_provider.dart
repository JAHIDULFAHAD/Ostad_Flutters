import 'package:flutter/cupertino.dart';

import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  int _pageSize = 30;

  int _currentPage = 0;

  int? _lastPageNo;

  bool _isCategoryLoading = false;

  bool _isMoreCategoryLoading = false;

  final List<CategoryModel> _categoriesList = [];

  List<CategoryModel> get categories => _categoriesList;

  bool get isCategoryLoading => _isCategoryLoading;
  bool get isMoreCategoryLoading => _isMoreCategoryLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoriesList() async {
    bool isSuccess = false;

    if (_currentPage == 0) {
      _categoriesList.clear();
      _isCategoryLoading = true;
    } else if (_currentPage < _lastPageNo!) {
      _isMoreCategoryLoading = true;
    } else {
      return false;
    }
    notifyListeners();
    _currentPage++;

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.categoriesListUrl(_pageSize, _currentPage),
    );
    if (response.isSuccess) {
      _lastPageNo ??= response.responseData['data']['last_page'];
      List<CategoryModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseData['data']['results']) {
        list.add(CategoryModel.fromJson(jsonData));
      }
      _categoriesList.addAll(list);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    if (_isCategoryLoading) {
      _isCategoryLoading = false;
    } else {
      _isMoreCategoryLoading = false;
    }
    notifyListeners();
    return isSuccess;
  }

  Future<void> loadIntialCategoriesList() async {
    _currentPage = 0;
    _lastPageNo = null;
    await getCategoriesList();
  }
}
