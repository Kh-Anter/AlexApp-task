import 'package:alexapp_task/models/order_model.dart';
import 'package:alexapp_task/presentation/screens/home/inner_screens.dart/chat_screen.dart';
import 'package:alexapp_task/presentation/screens/home/inner_screens.dart/home_screen.dart';
import 'package:alexapp_task/presentation/screens/home/inner_screens.dart/other_screen.dart';
import 'package:alexapp_task/presentation/screens/home/inner_screens.dart/todo_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> homeInnerScreens = [
    const HomeScreen(),
    const ChatScreen(),
    const TodoScreen(),
    const OtherScreen()
  ];
  int currentWidget = 0;

  List<Order> allRequests = [
    Order(
        allImgPaths: [
          "assets/images/box2.png",
          "assets/images/box2.png",
          "assets/images/box2.png",
          "assets/images/box2.png"
        ],
        personalImage: "assets/images/Oval.png",
        from: "1097 Daju Ridge",
        to: "1283 Cunema Extension",
        startDate: DateTime(2021, 7, 4, 0, 12),
        endDate: DateTime(2021, 7, 4, 23, 48),
        workerName: "ابو فهد عبد العزيز",
        workerNationality: "السعودية",
        message: "اريد توصيل شحنة خشب الي ميناء جدة  وزن الشحنة 100 طن",
        containersCount: 60,
        truckWeight: 100,
        vehiclesCount: 40,
        vehiclesType: "دينا - دينا بطحاء",
        cost: 2400)
  ];

  changeButtomNavBar(int newNavBar) {
    currentWidget = newNavBar;
    update();
  }
}
