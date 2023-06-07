import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/core/utils/localization_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppInitScreen extends StatelessWidget {
  const AppInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text('App Init Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(AppRoute.auth.login);
              },
              child: Text(tr(context).login),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(AppRoute.auth.register);
              },
              child: Text(tr(context).register),
            ),
          ],
        ),
      ),
    );
  }
}
