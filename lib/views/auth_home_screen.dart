import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/views/auth_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: true);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapShot.error != null) {
          return Center(child: Text('Ocorreu um erro inesperado!'));
        } else {
          return auth.isAuth ? ProductOverviewScreen() : AuthScreen();
        }
      },
    );
  }
}