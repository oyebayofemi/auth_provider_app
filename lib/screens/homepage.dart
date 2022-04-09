import 'package:auth_provider_app/provider/google_signin_provider.dart';
import 'package:auth_provider_app/screens/loggedin_page.dart';
import 'package:auth_provider_app/widget/signup_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);

              if (provider.isSigningIn) {
                return BuildLoading();
              } else if (snapshot.hasData) {
                return LoggedInPage();
              } else {
                return SignInPage();
              }
            },
          )),
    );
  }

  Widget BuildLoading() => Center(
        child: CircularProgressIndicator(),
      );
}
