import 'package:grat_app/models/grat_user.dart';
import 'package:grat_app/screens/authenticate/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grat_app/screens/home/home.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<GratUser>(context);

    if(user == null){
      return Login();
    }else{
      return HomeScreen();
    }
  }
}