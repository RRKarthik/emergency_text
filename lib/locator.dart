import 'package:geolocator/geolocator.dart';
import 'package:sms/sms.dart';
class Locator{
  double longitude;
  double latitude;

  Future<void> getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    longitude = position.longitude;
    latitude = position.latitude;
    print(longitude);
    print(latitude);
  }
  void sender(String phone,double longitude,double latitude){
    SmsSender smsSender = SmsSender();
    SmsMessage message =  SmsMessage(phone,"http://maps.google.com/maps?q=${latitude},${longitude}");
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    smsSender.sendSms(message);
  }

}
