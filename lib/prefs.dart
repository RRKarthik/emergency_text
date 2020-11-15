import 'package:shared_preferences/shared_preferences.dart';

class Prefs{

  String mobile;
  bool isNew ;

  Future<void> setMob(String x) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('mobile', x);
}
  Future<String> getMob() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    mobile = sp.getString('mobile');
  }
  Future<void> setAppHistory() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isNew', true);
  }

  Future<void> getAppHistory() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    isNew = sp.getBool('isNew');
  }
}
