import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

import 'package:grat_app/services/auth.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConfettiController _controllerBottomCenter;
  final AuthService _auth = AuthService();

  // @override
  // void initState() {
  //   ConfettiController(duration: const Duration(seconds: 5));
  //   _controllerBottomCenter =
  //       ConfettiController(duration: const Duration(seconds: 10));
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) => _controllerBottomCenter.play());
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _controllerBottomCenter.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff251F34),
      appBar: AppBar(
        title: Text("Grat"),
        elevation: 0.0,
        backgroundColor: Color(0xff251F34),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white54 ,),
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('logout', style: TextStyle(color: Colors.white54),),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: ConfettiWidget(
            //     confettiController: _controllerBottomCenter,
            //     blastDirection: pi / 2,
            //     maxBlastForce: 3, // set a lower max blast force
            //     minBlastForce: 2,
            //     emissionFrequency: 0.3,
            //     minimumSize: const Size(10,
            //         10), // set the minimum potential size for the confetti (width, height)
            //     maximumSize: const Size(20,
            //         20), // set the maximum potential size for the confetti (width, height)
            //     numberOfParticles: 1,
            //     gravity: 1,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Congratulations,',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 27
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('You have logged in.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 23
                ),
              ),
            ),
            SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset('images/success.svg')),
          ],
        ),
      ),
    );
  }
}

