class AppRoute {
  static String init = '/';
  static AuthRoutes auth = AuthRoutes();
  static ChatRoutes chat = ChatRoutes();
}

class AuthRoutes {
  String baseRoute = '/auth';
  String get login => '$baseRoute/login';
  String loginWithEmailAndPass(String email, String password) => '$baseRoute/login?email=$email&password=$password';
  String get register => '$baseRoute/register';
}

class ChatRoutes {
  String baseRoute = '/chat';
  String get home => '$baseRoute/home';
}
