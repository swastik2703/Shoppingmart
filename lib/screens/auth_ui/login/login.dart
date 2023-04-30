// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_ecommerce/constants/constants.dart';
import 'package:youtube_ecommerce/constants/routes.dart';
import 'package:youtube_ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:youtube_ecommerce/screens/auth_ui/sign_up/sign_up.dart';
import 'package:youtube_ecommerce/widgets/primary_button/primary_button.dart';
import 'package:youtube_ecommerce/widgets/top_titles/top_titles.dart';

import '../../custom_bottom_bar/custom_bottom_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    List images = ["googlelogo.png"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  subtitle: "Welcome Back To E Commerce App", title: "Login"),
              const SizedBox(
                height: 46.0,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password_sharp,
                  ),
                  suffixIcon: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      padding: EdgeInsets.zero,
                      child:  Icon(
                        isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      )),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              PrimaryButton(
                title: "Login",
                onPressed: () async {
                  bool isVaildated = loginVaildation(email.text, password.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const CustomBottomBar(), context: context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Center(child: Text("Don't have an account?")),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignUp(), context: context);
                  },
                  child: Text(
                    "Create an account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      height: 50,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(text: TextSpan(
                    text: "OR",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      height: 50,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),


              //SizedBox(height: ,),
              SizedBox(height: 5,),
              //for writing text we have Rich Text also
              Center(
                child: RichText(text: TextSpan(
                  text: "Login with different account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                )),
              ),

              /*
            ICONS
             */
              //SizedBox(height: 10,),
              Center(
                child: Wrap(
                  children: List<Widget>.generate(1, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,


                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            "assets/images/"+images[index],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
