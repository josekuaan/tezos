import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend/features/common/app_button.dart';
import 'package:spend/features/common/app_text_feild.dart';
import 'package:spend/features/common/color_constant.dart';
import 'package:spend/features/home/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey=GlobalKey<FormState>();
  final emailAddress = TextEditingController();
  final passkey = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                "assets/images/chevron-left.svg",
                height: 15,
                width: 15,
              ),
              const SizedBox(height: 20),
              const Text(
                "Log in to your account",
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20, fontFamily: "Inter"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome back! Please enter your registered email address to continue",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkGrey,
                    fontSize: 16,
                    fontFamily: "Inter"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const Text("Email address",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkGrey,
                              fontSize: 16,
                              fontFamily: "Inter")),
                      AppTextFeild(
                        controller: emailAddress,
                        hintText: "Enter Email",
                      ),
                      const SizedBox(height: 20),
                      const Text("Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkGrey,
                              fontSize: 16,
                              fontFamily: "Inter")),
                      AppPasswordFeild(
                        controller: passkey,
                        hintText: "Enter password",
                      )
                    ],
                  ),
                ),
              ),
              AppButton.plainButton(context,
                  name: "continue",
                  apply: (){
                if(formKey.currentState!.validate()){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
                }
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
