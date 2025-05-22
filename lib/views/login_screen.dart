import 'package:flutter/material.dart';
import 'package:newshave/views/utils/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              vsLarge,
              Text(
                'Hello',
                style: headline3.copyWith(
                  fontWeight: bold,
                  color: cBlack,
                ),
              ),
              Text(
                'Again!',
                style: headline3.copyWith(
                  fontWeight: bold,
                  color: cPrimary,
                ),
              ),
              vsTiny,
              Text(
                'Welcome back you’ve been missed',
                style: subtitle2.copyWith(color: cTextBlue),
              ),
              vsLarge,
              RichText(
                text: TextSpan(
                  text: '* ',
                  style: subtitle2.copyWith(color: cError),
                  children: [
                    TextSpan(
                      text: 'Email',
                      style: subtitle2.copyWith(color: cBlack),
                    ),
                  ],
                ),
              ),
              vsTiny,
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: fieldPadding,
                  border: enableBorder,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                ),
              ),
              vsMedium,
              RichText(
                text: TextSpan(
                  text: '* ',
                  style: subtitle2.copyWith(color: cError),
                  children: [
                    TextSpan(
                      text: 'Password',
                      style: subtitle2.copyWith(color: cBlack),
                    ),
                  ],
                ),
              ),
              vsTiny,
              TextField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: fieldPadding,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: cBlack,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: enableBorder,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password ?',
                    style: subtitle2.copyWith(
                      color: cError,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              vsMedium,
              SizedBox(
                height: fieldHeight,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: subtitle1.copyWith(
                      fontWeight: bold,
                      color: cWhite,
                    ),
                  ),
                ),
              ),
              vsLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account? ',
                    style: caption.copyWith(color: cBlack),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: caption.copyWith(
                        color: cTextBlue,
                        fontWeight: bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              vsLarge,
            ],
          ),
        ),
      ),
    );
  }
}
