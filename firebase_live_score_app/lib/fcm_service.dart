import 'package:firebase_messaging/firebase_messaging.dart';

class FcmService {
  static Future<void> intialize() async {
    await FirebaseMessaging.instance.requestPermission();

    //Foreground
    FirebaseMessaging.onMessage.listen(_handleNotification);

    //Background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotification);

    //Terminated
    FirebaseMessaging.onBackgroundMessage(_handleTerminatedNotification);
  }
  static void _handleNotification(RemoteMessage message){
    print(message.data);
    print(message.notification!.title);
    print(message.notification!.body);
  }
  static Future<String?> getToken() async {
    return  FirebaseMessaging.instance.getToken();
  }
  static void onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken){
      print(newToken);
    });
  }
}
Future<void> _handleTerminatedNotification(RemoteMessage message) async {

}