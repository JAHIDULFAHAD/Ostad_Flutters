import 'package:crafty_bay/core/services/network_caller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
    onUnauthorize: () {
      // move to login
    },
    headers: {
      'content-type': 'application/json',
      'token': 'token'
    },
  );
  return networkCaller;
}