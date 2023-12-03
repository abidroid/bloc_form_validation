import 'package:bloc_form_validation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailC, passC;

  @override
  void initState() {
    super.initState();
    emailC = TextEditingController();
    passC = TextEditingController();
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailC,
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                  emailValue: emailC.text,
                  passValue: passC.text,
                ));
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passC,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                  emailValue: emailC.text,
                  passValue: passC.text,
                ));
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return CupertinoButton(
                    color: (state is SignInValidState) ? Colors.blue : Colors.grey,
                    onPressed: (state is SignInValidState)
                        ? () {
                            BlocProvider.of<SignInBloc>(context).add(SignInLoadingEvent());
                          }
                        : null,
                    child: const Text('Sign in'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
