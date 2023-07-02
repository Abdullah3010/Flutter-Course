import 'package:chat_app/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

final List<Bind> modularBind = [
  Bind.singleton((_) => FirebaseAuth.instance),
  Bind.singleton((_) => Constants()),
];
