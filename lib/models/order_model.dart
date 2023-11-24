class Order {
  List allImgPaths;
  String personalImage;
  String from;
  String to;
  DateTime startDate;
  DateTime endDate;
  String workerName;
  String workerNationality;
  String message;
  int truckWeight;
  int containersCount;
  int vehiclesCount;
  String vehiclesType;
  int cost;

  Order(
      {required this.allImgPaths,
      required this.personalImage,
      required this.from,
      required this.to,
      required this.startDate,
      required this.endDate,
      required this.workerName,
      required this.workerNationality,
      required this.message,
      required this.containersCount,
      required this.truckWeight,
      required this.vehiclesCount,
      required this.vehiclesType,
      required this.cost});
}
