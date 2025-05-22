import 'package:flutter/material.dart';
import 'package:newshave/views/utils/helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                style: headline3.copyWith(fontWeight: bold, color: cBlack),
              ),
              vsTiny,
              Text(
                'Sign up to get started!',
                style: subtitle2.copyWith(color: cTextBlue),
              ),
              vsLarge,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '* ',
                      style: subtitle2.copyWith(color: cError),
                    ),
                    TextSpan(
                      text: 'Name',
                      style: subtitle2.copyWith(color: cBlack),
                    ),
                  ],
                ),
              ),
              vsTiny,
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  contentPadding: fieldPadding,
                  border: enableBorder,
                  enabledBorder: enableBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                ),
              ),
              vsMedium,
              vsTiny,
              RichText(
                text: TextSpan(
                  text: '* ',
                  style: subtitle2.copyWith(color: cError),
                  children: [
                    TextSpan(
                      text: 'Phone Number',
                      style: subtitle2.copyWith(color: cBlack),
                    ),
                  ],
                ),
              ),
              vsTiny,
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
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
                      text: 'Email',
                      style: subtitle2.copyWith(color: cBlack),
                    ),
                  ],
                ),
              ),
              vsTiny,
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                    'Sign Up',
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
                    'Already have an account? ',
                    style: caption.copyWith(color: cBlack),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Login',
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
