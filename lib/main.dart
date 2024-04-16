import 'package:city_way/app/my_app.dart';
import 'package:city_way/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:city_way/core/injection/injection_container.dart' as di;

// TODO Theme
//TextStyle for all app..FontSize & FontWeight & Color..etc
//hieght & width
//Padding
//type of field 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //! Dependacy Injection Box Initilization
  await di.init();

  //! Firebase Inititization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}