import 'package:flutter/material.dart';
import 'package:flutter_login_tut/generated/i18n.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).splashS),
      ),
    );
  }
}
