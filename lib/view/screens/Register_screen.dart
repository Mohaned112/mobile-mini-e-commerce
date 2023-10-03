import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/Auth_cubit/auth_cubit.dart';

import '../../widgets/elevated_button.dart';
import '../../widgets/text_costume.dart';
import '../../widgets/text_form_field_costume.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterScreen(),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AuthCubit();
              return Form(
                key: _registerFormKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset(
                      'assets/R.png',
                      height: 150.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const TextCustom(
                      text: 'Create Account',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldCustom(
                      controller: _nameController,
                      'Name',
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if ((value ?? '').isEmpty) {
                          return 'Name is required';
                        }

                        return null;
                      },
                      labelText: 'Name',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormFieldCustom(
                      controller: _emailController,
                      'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if ((value ?? '').isEmpty) {
                          return 'Email is required';
                        }

                        return null;
                      },
                      labelText: 'Email',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormFieldCustom(
                      controller: _passwordController,
                      'Password',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      validator: (String? value) {
                        if ((value ?? '').isEmpty) {
                          return 'Password is required';
                        } else if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else if (RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
                        ).hasMatch(value ?? '')) {}

                        return null;
                      },
                      labelText: 'Password',
                      obSecure: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state is RegisterLoading
                        ? const CircularProgressIndicator.adaptive()
                        : ElevatedButtonCustom(
                      backgroundColor: Colors.black,
                            onPressed: () {
                              if (_registerFormKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context)
                                    .registerUser(_emailController.text,
                                        _passwordController.text)
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              }
                            },
                            text: 'Create Account',
                          )
                  ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
