import 'package:chat_app/core/naviagtion/bind.dart';
import 'package:chat_app/core/naviagtion/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = modularBind;

  @override
  final List<ModularRoute> routes = modeularRoutes;
}
