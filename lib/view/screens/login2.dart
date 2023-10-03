import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _loginTestState();
}

class _loginTestState extends State<LoginTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
        ],
      ),
    );
  }
}
