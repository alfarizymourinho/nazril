import 'package:belajar_getx/app/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
                            Text("Register"),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onNameChanged,
                              decoration: InputDecoration(
                                hintText: "Nama Lengkap",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input Nama';
                                }
                                return null;
                              },
                            ),
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
                                  return 'Input Email';
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
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                               // Set this property to true for password field
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
                                    controller.register();
                                  }
                                },
                              ),
                            ),
                          SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the registration screen
                              // You can replace `RegistrationFormScreen` with your actual registration screen class
                              // Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                //   // builder: (context) => LoginForm(),
                                // ),
                              // );
                              Get.toNamed("/login");
                            },
                            child: Text(
                              "Kembali Ke Login",
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
