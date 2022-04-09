import 'package:auth_provider_app/provider/google_signin_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = FirebaseAuth.instance.currentUser;

    String? url = users!.photoURL;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LoggedIN'),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(url!),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Name: ${users.displayName}'),
            SizedBox(
              height: 20,
            ),
            Text('Email: ${users.email}'),
            SizedBox(
              height: 40,
            ),
            FlatButton.icon(
                color: Colors.yellow,
                onPressed: () async {
                  final auth =
                      Provider.of<GoogleSignInProvider>(context, listen: false);

                  await GoogleSignInProvider().signout();
                },
                icon: Icon(Icons.logout_outlined),
                label: Text('Loggout'))
          ],
        ),
      ),
    );
  }
}
