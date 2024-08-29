import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociogram/app/modules/login_screen/views/login_screen_view.dart';
import 'package:sociogram/app/modules/pnumber_screen/views/pnumber_screen_view.dart';

import '../../../../config/app_color.dart';
import '../../../../config/app_contents.dart';
import '../../../../config/common_button.dart';
import '../../../../config/common_textfield.dart';
import '../controllers/register_controller.dart';

// ignore: must_be_immutable
class RegisterView extends GetView<RegisterController> {
 RegisterView({Key? key}) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(Appcontent.back, height: 24,)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 40),
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Urbanist-bold'),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text('Please input your form register.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Urbanist-medium'),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70, left: 10, right: 10, bottom: 10),
                    child: textfield(
                        text: 'Enter your Name...', text1: 'Full name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: textfield(
                        text: 'Enter your username...',
                        text1: 'Username or Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GetBuilder<RegisterController>(
                      builder: (context) {
                        return TextField(
                          obscureText: registerController.showPassword,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              hintText: "Min. 8 characters...",
                              labelText: 'Password',

                              suffixIcon: InkWell(
                                onTap: () {
                                  registerController.changePasswordhideAndShow();
                                },
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: registerController.showPassword ? Image.asset("assets/eye-slash.png", height: 24, width: 24,) : const Icon(Icons.visibility_outlined, color: Color(0xff94A3B8),),
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey.shade200),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey.shade200),
                              )),
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Note : ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          TextSpan(
                              text: 'With sign up, you agree to the ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          TextSpan(
                              text: 'Terms & Conditions\n',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          TextSpan(
                              text: 'and ',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          TextSpan(
                              text: 'Privacy Policy.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: elevated(
                      text: 'Sign Up',
                      onPress: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const PnumberScreenView()),);
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 150)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ? ',
                          style: TextStyle(color: Colors.grey[500]),
                          overflow: TextOverflow.ellipsis),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenView()),);
                        },
                        child: const Text('Sign In',
                            style: TextStyle(
                                color: AppColor.purple,
                                fontFamily: 'Urbanist'),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
