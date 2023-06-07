import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/moduls/auth/views/init_screen.dart';
import 'package:chat_app/moduls/auth/views/login/login_screen.dart';
import 'package:chat_app/moduls/auth/views/register/register_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_interfaces/modular_interfaces.dart';

List<ModularRoute> modeularRoutes = <ChildRoute<dynamic>>[
  ChildRoute<dynamic>(
    AppRoute.init,
    child: (_, __) => const AppInitScreen(),
  ),
  ChildRoute<dynamic>(
    AppRoute.auth.login,
    child: (_, __) => const LoginScreen(),
  ),
  ChildRoute<dynamic>(
    AppRoute.auth.register,
    child: (_, __) => const RegisterScreen(),
  ),
];
