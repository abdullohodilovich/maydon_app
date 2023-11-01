import 'package:flutter/material.dart';
import 'package:maydon_app/app.dart';
import 'package:maydon_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaydonApp());
}
