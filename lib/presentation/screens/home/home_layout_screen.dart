import 'package:alexapp_task/const/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../busness_logic/home_ctrl.dart';

class HomeLayoutScreen extends StatelessWidget {
  HomeLayoutScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Stack(
            children: [
              Positioned(
                bottom: -2,
                left: 5,
                right: -1,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                      height: 180,
                      width: 200,
                      color: AppStrings.borderColor,
                      child: null),
                ),
              ),
              Positioned(
                bottom: 1,
                left: 6,
                right: 0,
                child: ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                      height: 170,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 100, bottom: 10),
                      width: double.infinity,
                      color: Colors.white,
                      child: Align(
                        alignment: Alignment.center,
                        child: GetBuilder(
                          init: HomeController(),
                          builder: (ctrl) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              homeNavbarBtn(ctrl),
                              chatNavbarBtn(ctrl),
                              todoNavbarBtn(ctrl),
                              otherNavbarBtn(ctrl),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              GetBuilder(
                  init: HomeController(),
                  builder: (ctrl) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ctrl.homeInnerScreens[ctrl.currentWidget]))
            ],
          ),
        ),
      ),
    );
  }

  Widget homeNavbarBtn(ctrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => ctrl.changeButtomNavBar(0),
          child: SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/home.png")),
        ),
        if (ctrl.currentWidget == 0) underLineWidget()
      ],
    );
  }

  Widget chatNavbarBtn(ctrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () => ctrl.changeButtomNavBar(1),
            child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/chat.png"))),
        if (ctrl.currentWidget == 1) underLineWidget()
      ],
    );
  }

  Widget todoNavbarBtn(ctrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => ctrl.changeButtomNavBar(2),
          child: SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/todo.png")),
        ),
        if (ctrl.currentWidget == 2) underLineWidget()
      ],
    );
  }

  Widget otherNavbarBtn(ctrl) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => ctrl.changeButtomNavBar(3),
          child: SizedBox(
              height: 35,
              width: 35,
              child: Image.asset("assets/icons/Group.png")),
        ),
        if (ctrl.currentWidget == 3) underLineWidget()
      ],
    );
  }

  underLineWidget() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Container(
            width: 47,
            height: 3,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle, color: AppStrings.primaryColor)),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0017000, size.height);
    path_0.quadraticBezierTo(size.width * 1.0017000, size.height * 0.7528000,
        size.width * 1.0017000, size.height * 0.6704000);
    path_0.cubicTo(
        size.width * 1.0017250,
        size.height * 0.4946500,
        size.width * 0.9633750,
        size.height * 0.5111500,
        size.width * 0.9250000,
        size.height * 0.5050000);
    path_0.quadraticBezierTo(size.width * 0.8500000, size.height * 0.5037500,
        size.width * 0.5002000, size.height * 0.5960000);
    path_0.quadraticBezierTo(size.width * 0.1811000, size.height * 0.5012000,
        size.width * 0.0718000, size.height * 0.5032000);
    path_0.quadraticBezierTo(size.width * 0.0050500, size.height * 0.5215000, 0,
        size.height * 0.6500000);
    path_0.lineTo(size.width * -0.0025000, size.height);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
