import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // svg image
              SvgPicture.asset('assets/ic_instagram.svg',
                  height: 64,
                  colorFilter:
                      const ColorFilter.mode(primaryColor, BlendMode.srcIn)),

              const SizedBox(height: 64),
              // text field input for email

              // text field input for password

              // button login

              // Transitioning to signing up
            ],
          )),
    ));
  }
}
