import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier {
  bool _passwordVisible = true;

  bool get passwordVisible => _passwordVisible;

  bool _loading = false;

  bool get loading => _loading;

  void togglePassword() {
    _passwordVisible = !_passwordVisible;
    debugPrint(_passwordVisible.toString());
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        debugPrint("object done");
        debugPrint(response.body);

        setLoading(false);
      } else {
        debugPrint("object undone");
        setLoading(false);
      }
    } catch (e) {
      debugPrint(e.toString());
      setLoading(false);
    }
  }
}
