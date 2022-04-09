import 'package:auth_provider_app/provider/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(),
            Text('Welcome'),
            FlatButton(
                color: Colors.green,
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.signInWithGoogle();
                },
                child: Text('Signin with google')),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
