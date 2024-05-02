import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:belajar_getx/app/helpers/size_helper.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Login"),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onEmailChanged,
                              decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onPasswordChanged,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              // obscureText: _isHiddenPassword, // Set this property to true for password field
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Input Password';
                              }
                              return null;
                            },
                          ),
                             SizedBox(height: 18),
                            SizedBox(
                              width: displayWidth(context) * 0.8,
                              height: displayHeight(context) * 0.075,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white60),
                                  )),
                                ),
                                child: Text("Login"),
                                onPressed: () {
                                  if (controller.formKey.currentState!.validate()) {
                                    controller.login();
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 18),
                          Text("Don't have an account?"),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the registration screen
                              // You can replace `RegistrationFormScreen` with your actual registration screen class
                              // Navigator.push(
                              //   context
                              //   // MaterialPageRoute(
                              //   //   // builder: (context) => RegisterForm(),
                              //   // ),
                              // );
                              Get.toNamed("/register");
                            },
                            child: Text(
                              "Register here",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
