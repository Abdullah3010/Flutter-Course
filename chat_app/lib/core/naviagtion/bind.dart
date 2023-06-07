import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

final List<Bind> modularBind = [
  Bind.singleton((_) => FirebaseAuth.instance),
];
