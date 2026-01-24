import 'package:crafty_bay/core/services/network_caller.dart';

import '../features/auth/presentation/providers/auth_controller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
    onUnauthorize: () {
      // move to login
    },
    headers: {
      'content-type': 'application/json',
      'token': AuthController.accessToken ?? '',
    },
  );
  return networkCaller;
}