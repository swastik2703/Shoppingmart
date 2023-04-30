import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'auth_ui/welcome/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  changeScreen() {
    Future.delayed(Duration(seconds: 3), (){
      Get.to(()=> Welcome());
    });
  }

  void initState(){
    changeScreen();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade200,
      body: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300),
            // ),
            320.heightBox,
            Image.asset('assets/images/emart1.jpeg').box.white.size(80, 77).padding(EdgeInsets.all(8.0)).rounded.make(),
            10.heightBox,
            Text('Emart', style: TextStyle(fontSize: 18, color: Colors.white),),
            5.heightBox,
            Text('version- 3.0.1', style: TextStyle(fontSize: 18, color: Colors.white),),
            // appversion.text.white.make(),
            const Spacer(),
            Text('Shopping Mart', style: TextStyle(color: Colors.white)),
            // credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
