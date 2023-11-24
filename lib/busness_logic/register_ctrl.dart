import 'package:alexapp_task/models/phone_code_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  List<PhoneCode> allCodes = [
    PhoneCode(code: 966, imgUrl: "assets/images/saudi-arabia.png"),
    PhoneCode(code: 20, imgUrl: "assets/images/Flag_of_Egypt.svg.png")
  ];
  PhoneCode? selectedCode;
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  changeSelectedCode(String code) {
    int newCode = int.parse(code);
    selectedCode = allCodes.firstWhere((element) => element.code == newCode);
    update();
  }
}
