import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';
import 'package:teleheal_app/pages/auth/register_screen.dart';
import 'package:teleheal_app/pages/layout/tab_layout.dart';
import 'package:teleheal_app/widget/dialog.dart';
import 'package:teleheal_app/widget/input_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teleheal_app/widget/long_button.dart';

import '../../config/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusEmail;
  FocusNode focusPassword;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isProtected = true;
  bool approved = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: colorWhite,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            "Login",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5), fontSize: 12),
                      ),
                      height20,
                      FocusScope(
                        child: InputWidget1(
                          fieldController: emailController,
                          hintText: "Enter Email..",
                          labelText: "Email",
                          callbackValidation: (val) {
                            if (val.isEmpty) {
                              return "Email tidak boleh kosong!";
                            }
                            if (!regexEmail.hasMatch(val)) {
                              return "Email tidak valid!";
                            }
                            return null;
                          },
                          isEditable: true,
                          centerText: false,
                          keyType: TextInputType.emailAddress,
                          focusNode: focusEmail,
                        ),
                      ),
                      height15,
                      FocusScope(
                        child: InputWidget1(
                          fieldController: passController,
                          hintText: "Enter Password",
                          labelText: "Password",
                          callbackValidation: (val) {
                            if (val.isEmpty) {
                              return "Password tidak boleh kosong!";
                            }
                            if (val.length < 6) {
                              return "Password terdiri dari minimum 6 karakter!";
                            }
                            return null;
                          },
                          icon: isProtected
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          isProtected: isProtected,
                          centerText: false,
                          keyType: TextInputType.text,
                          focusNode: focusEmail,
                          callbackIcon: () {
                            setState(() {
                              isProtected = !isProtected;
                            });
                          },
                        ),
                      ),
                      height20,
                      LongButton(
                        width: SizeConfig.screenWidth,
                        title: "Login",
                        onClick: () async {
                          if (formKey.currentState.validate()) {
                            showDialog(
                                    context: context,
                                    builder: (context) {
                                      return dialogWaiting(context);
                                    })
                                .then((value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LayoutScreen(
                                            title: "Goto Screen"))));
                            await Future.delayed(const Duration(seconds: 3))
                                .then((value) => Navigator.pop(context));
                          }
                        },
                      ),
                      height10,
                      RichText(
                        text: TextSpan(
                          text: "Don't have account yet?",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Register',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()));
                                  },
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorPrimary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
