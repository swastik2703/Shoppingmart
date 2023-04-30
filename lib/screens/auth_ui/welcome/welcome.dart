import 'package:flutter/material.dart';
import 'package:youtube_ecommerce/constants/asset_images.dart';
import 'package:youtube_ecommerce/constants/routes.dart';
import 'package:youtube_ecommerce/screens/auth_ui/login/login.dart';
import 'package:youtube_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:youtube_ecommerce/widgets/top_titles/top_titles.dart';

import '../sign_up/sign_up.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h*0.15,),
            Center(child: Text('Welcome', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold))),
            Center(child: Text('Shop at best prices', style: TextStyle(fontSize: 18, color: Colors.black),)),
            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/emart1.jpeg', width: w*0.8,height: h*0.18,
              ),
            ),
            Spacer(),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(widget: const Login(), context: context);
              },
            ),
            const SizedBox(
              height: 18.0,
            ),
            PrimaryButton(
              title: "Sign Up",
              onPressed: () {
                Routes.instance.push(widget: const SignUp(), context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
