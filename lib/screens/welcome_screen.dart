import 'package:bloc_form_validation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_form_validation/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(
                child: Center(
                    child: FlutterLogo(
              size: 150,
            ))),
            CupertinoButton(
                color: Colors.blue,
                child: const Text('Sign in'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return BlocProvider(
                      create: (context) => SignInBloc(),
                      child: const LoginScreen(),
                    );
                  }));
                }),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(color: Colors.blue, child: const Text('Sign up'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
