import 'package:flutter/cupertino.dart';
import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../data/models/slider_model.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSliderInProgress = false;

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;

  List<SliderModel> _homeSliderList = [];

  List<SliderModel> get homeSliderList => _homeSliderList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;


  Future<bool> getHomeSlider() async {
    bool isSuccess = false;
    _getHomeSliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      List<SliderModel> sliders = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']['results']) {
        sliders.add(SliderModel.fromJson(jsonData));
      }
      _homeSliderList = sliders;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getHomeSliderInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
