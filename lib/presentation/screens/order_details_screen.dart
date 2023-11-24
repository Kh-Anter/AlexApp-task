import 'package:alexapp_task/const/strings.dart';
import 'package:alexapp_task/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({required this.order, Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final PageController pageController = PageController(initialPage: 0);

  final TextStyle normalTxtStyle =
      const TextStyle(color: AppStrings.subTitleColor, fontSize: 16);

  final TextStyle dataTxtStyle =
      const TextStyle(color: AppStrings.locationColor, fontSize: 16);
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  const SizedBox(height: 30),
                  pageView(),
                  const SizedBox(height: 10),
                  pageIndicator(),
                  const SizedBox(height: 15),
                  workerData(),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      location("موقع التحميل", widget.order.from),
                      const Spacer(flex: 1),
                      location("موقع التنزيل", widget.order.to),
                    ],
                  ),
                  const Divider(thickness: 1, height: 30),
                  Row(
                    children: [
                      time("وقت التحميل", formatDate(widget.order.startDate),
                          formatTime(widget.order.startDate)),
                      const Spacer(),
                      time("وقت التسليم", formatDate(widget.order.endDate),
                          formatTime(widget.order.endDate)),
                    ],
                  ),
                  const Divider(height: 30),
                  vehicleDetails("assets/images/box.png", "وزن الشاحنة",
                      "${widget.order.truckWeight.toString()} طن"),
                  const Divider(height: 30),
                  vehicleDetails("assets/images/box.png", "عدد الحاويات",
                      "${widget.order.containersCount.toString()} صندوق"),
                  const Divider(height: 30),
                  vehicleDetails("assets/images/loury.png", "عدد المركبات",
                      "${widget.order.vehiclesCount.toString()} شاحنه"),
                  const Divider(height: 30),
                  vehicleDetails("assets/images/loury.png", "نوع المركبات",
                      widget.order.vehiclesType),
                  const Divider(height: 30),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        widget.order.message,
                        style: dataTxtStyle,
                      )),
                  const SizedBox(height: 15),
                  Image.asset("assets/images/map.png"),
                  const SizedBox(height: 220),
                ]),
              ),
              expandableWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget expandableWidget() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: isExpanded ? 200 : 90,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppStrings.borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(
                  !isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 35,
                )),
          ),
          Text("تحديد السعر بين العميل والسائق", style: normalTxtStyle),
          if (isExpanded)
            Row(
              children: [
                Text("السعر الحالي : ", style: normalTxtStyle),
                Text("${widget.order.cost.toString()} ريال",
                    style: const TextStyle(color: AppStrings.primaryColor)),
              ],
            ),
          const SizedBox(height: 10),
          if (isExpanded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customBtn("قدم عرض", "assets/icons/camera.png"),
                customBtn("موافقه", "assets/icons/check.png"),
                customBtn("رفض", "assets/icons/close.png")
              ],
            )
        ]),
      ),
    );
  }

  InkWell customBtn(String txt, String imgUrl) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 96,
            height: 57,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppStrings.borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(txt, style: normalTxtStyle)
        ],
      ),
    );
  }

  Row vehicleDetails(String imgUrl, String title, String data) {
    return Row(
      children: [
        SizedBox(width: 25, child: Image.asset(imgUrl)),
        const SizedBox(width: 5),
        Text(title, style: normalTxtStyle),
        const Spacer(),
        Text(
          data,
          style: dataTxtStyle,
        ),
      ],
    );
  }

  Widget location(String title, String location) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          const Icon(Icons.location_on, size: 30),
          const SizedBox(width: 4),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: normalTxtStyle),
              Text(
                location,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: dataTxtStyle,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget time(String title, String date, String time) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          SizedBox(height: 30, child: Image.asset("assets/images/date.png")),
          const SizedBox(width: 4),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: normalTxtStyle,
            ),
            Text(
              date,
              style: dataTxtStyle,
            ),
            Text(
              time,
              style: dataTxtStyle,
            )
          ])
        ],
      ),
    );
  }

  Container workerData() {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppStrings.borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                  width: 40, child: Image.asset(widget.order.personalImage))),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.workerName,
                  style: normalTxtStyle,
                ),
                Text(widget.order.workerNationality, style: normalTxtStyle)
              ])
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () => Navigator.maybePop(context))
      ],
      title: const Center(
          child: Text(
        "تفاصيل الطلب",
      )),
    );
  }

  pageView() {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: PageView(
          controller: pageController,
          children: List.generate(widget.order.allImgPaths.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Image.asset(widget.order.allImgPaths[index],
                  fit: BoxFit.fill),
            );
          })),
    );
  }

  pageIndicator() {
    return SmoothPageIndicator(
        controller: pageController,
        count: widget.order.allImgPaths.length,
        effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            spacing: 5,
            radius: 20,
            activeDotColor: AppStrings.primaryColor,
            dotColor: AppStrings.secondaryColor));
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }
}
