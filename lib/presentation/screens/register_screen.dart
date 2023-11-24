import 'package:alexapp_task/busness_logic/register_ctrl.dart';
import 'package:alexapp_task/const/strings.dart';
import 'package:alexapp_task/models/phone_code_model.dart';
import 'package:alexapp_task/presentation/screens/home/home_layout_screen.dart';
import 'package:alexapp_task/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ResgisterScreen extends StatelessWidget {
  ResgisterScreen({Key? key}) : super(key: key);
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    controller.selectedCode = controller.allCodes[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgWidget(),
            const SizedBox(height: 50),
            Row(
              children: [
                codeWidget(),
                phoneWidget(),
              ],
            ),
            passwordTextField(),
            forgotPass(),
            loginBtn(),
            const Spacer(),
            registerNowBtn()
          ],
        ),
      )),
    );
  }

  Padding registerNowBtn() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ليس لديك حساب ",
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
                onPressed: () {},
                child: const Text("سجل الان",
                    style: TextStyle(
                        fontSize: 18, color: AppStrings.primaryColor)))
          ],
        ));
  }

  SizedBox loginBtn() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(AppStrings.primaryColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () => Get.to(() => HomeLayoutScreen()),
        child: const Text(
          "تسجيل الدخول",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  TextButton forgotPass() {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "هل نسيت كلمة السر؟",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ));
  }

  Widget imgWidget() {
    return Center(
      child: SizedBox(
          width: 100, height: 200, child: Image.asset("assets/images/car.png")),
    );
  }

  CustomTextField passwordTextField() {
    return CustomTextField(
      controller: controller.passwordCtrl,
      labelText: "كلمة المرور",
      type: TextInputType.text,
      isPassword: true,
    );
  }

  Widget phoneWidget() {
    return Expanded(
      child: CustomTextField(
        controller: controller.phoneCtrl,
        hintText: "0123456789",
        type: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  Widget codeWidget() {
    return GetBuilder(
      init: RegisterController(),
      builder: (ctrl) => Container(
        height: 50,
        width: 110,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: const SizedBox(),
              value: ctrl.selectedCode!.code.toString(),
              borderRadius: BorderRadius.zero,
              elevation: 0,
              underline: null,
              isDense: true,
              items: ctrl.allCodes
                  .map<DropdownMenuItem<String>>((PhoneCode phoneCode) {
                return DropdownMenuItem<String>(
                  value: phoneCode.code.toString(),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset(phoneCode.imgUrl)),
                        const SizedBox(width: 10),
                        Text("+${phoneCode.code.toString()}"),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newVale) {
                if (newVale != null) {
                  controller.changeSelectedCode(newVale);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
