import 'package:http/http.dart' as http;

var _url = Uri(
  scheme: "http",
  host: "10.0.2.2",
  path: "/mini-chat/auth/sign-in",
  port: 3000,
);

login(String uname, String upass) async {
  try {
    var res = await http.post(
      _url,
      body: {"username": uname, "password": upass},
    );
    if (res.statusCode >= 300) {
      throw "请求出错";
    }
    print("Hi");
  } catch (error) {
    print(error);
  }
}
