import 'package:shared_preferences/shared_preferences.dart';

void createshe(email, password) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setString("e1", email);
  shr.setString('p1', password);
}

void createusershe(email, password) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setString('e2', email);
  shr.setString('p2', password);
}


Future<String?> readuserEmailpref() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  String? email = shr.getString("e2");
  return email;
}

Future<String?> reademailpref() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  String? email = shr.getString("e1");
  return email;
}
Future<String?> readpasswordpref() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  String? password = shr.getString('p1');
  return password;
}

void clearpref() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.clear();
}

void alreadylogin(boolian) async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setBool('b1', boolian);
}

Future<bool?> readlogin() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  bool? boolian = shr.getBool('b1');
  return boolian;
}
