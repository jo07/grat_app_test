import 'package:flutter/material.dart';
import 'package:grat_app/models/grat_user.dart';
import 'package:grat_app/screens/auth_wrapper.dart';
import 'package:grat_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/authenticate/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<GratUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'
        ),
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    );
  }
}