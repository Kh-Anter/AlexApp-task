import 'package:alexapp_task/busness_logic/home_ctrl.dart';
import 'package:alexapp_task/const/strings.dart';
import 'package:alexapp_task/models/order_model.dart';
import 'package:alexapp_task/presentation/screens/order_details_screen.dart';
import 'package:alexapp_task/const/utlis/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  int selectedSection = 0;
  late List allSections;
  @override
  Widget build(BuildContext context) {
    allSections = [oredersBody, inprogressBody, finishedBody, canceledBody];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("الطلبات")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            allOrdersSection(),
            allSections[selectedSection](),
          ],
        ),
      ),
    );
  }

  Widget allOrdersSection() {
    return Stack(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppStrings.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Positioned(
          top: 5,
          left: 5,
          right: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleOfSections("الطلبات", 0),
              titleOfSections("الجاريه", 1),
              titleOfSections("المنتهيه", 2),
              titleOfSections("الملغاه", 3),
            ],
          ),
        )
      ],
    );
  }

  Widget titleOfSections(String text, int id) {
    return InkWell(
      onTap: () {
        if (id != selectedSection) setState(() => selectedSection = id);
      },
      child: Container(
        alignment: Alignment.center,
        width: 80,
        height: 40,
        decoration: selectedSection == id
            ? const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)))
            : null,
        child: Text(text),
      ),
    );
  }

  Widget oredersBody() => Column(
      children: List.generate(controller.allRequests.length,
          (index) => orederCard(controller.allRequests[index])));

  Container orederCard(Order order) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: AppStrings.borderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          cardPart1(order),
          const Divider(thickness: 1),
          cardPart2(order)
        ],
      ),
    );
  }

  Row cardPart2(Order order) {
    return Row(children: [
      cardDateWidget(order),
      const Spacer(),
      detailsBtn(order),
      const SizedBox(width: 10),
      closeBtn(),
    ]);
  }

  Row cardPart1(Order order) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      orderCardPicture(order),
      const SizedBox(width: 8),
      Expanded(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(order.workerName,
                  style: Themes.orderUserName, overflow: TextOverflow.ellipsis),
              fromToLocations(order),
              Text(
                order.message,
                style: Themes.orderUserName,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          cardPrice()
        ]),
      ),
    ]);
  }

  Align cardPrice() {
    return Align(
      alignment: Alignment.topLeft,
      child: OutlinedButton(
          onPressed: () {},
          child: const Text(
            "السعر",
            style: Themes.cardButtonTxt,
          )),
    );
  }

  TextButton cardDateWidget(Order order) {
    return TextButton.icon(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(AppStrings.locationColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.date_range,
          color: AppStrings.titleColor,
        ),
        label: Text(formatDate(order.startDate)));
  }

  Container closeBtn() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppStrings.borderColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: 40,
      height: 40,
      child: const Center(child: Icon(Icons.close)),
    );
  }

  ElevatedButton detailsBtn(Order order) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppStrings.primaryColor),
            foregroundColor: MaterialStateProperty.all(AppStrings.titleColor)),
        onPressed: () => Get.to(() => OrderDetailsScreen(order: order)),
        child: const Text(
          "التفاصيل",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Widget orderCardPicture(Order order) {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(top: 20),
      child: Image.asset(
        order.allImgPaths[0],
      ),
    );
  }

  Row fromToLocations(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.circle,
                  size: 12, color: AppStrings.locationColor),
              ...List.generate(
                  5,
                  (index) => const Icon(Icons.circle,
                      size: 2, color: AppStrings.locationColor)),
              const Icon(
                Icons.circle,
                size: 12,
                color: AppStrings.primaryColor,
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.from,
                  style: Themes.orderLocation,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  order.to,
                  style: Themes.orderLocation,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget inprogressBody() => Container();

  Widget finishedBody() => Container();

  Widget canceledBody() => Container();
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  return formatter.format(dateTime);
}
