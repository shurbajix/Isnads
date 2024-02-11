import 'package:fl_chart/fl_chart.dart';

class StateItem {
  String title;
  String? number;
  String? image;
  String? description;
  LineChartData? chartData; // New property for chart data

  StateItem({
    required this.title,
    this.number,
    this.image,
    this.description,
    this.chartData, // Pass chart data as a parameter
  });

  // Factory method to create StateItem instances with chart data
  factory StateItem.withChartData({
    required String title,
    String? number,
    String? image,
    String? description,
    required LineChartData chartData,
  }) {
    return StateItem(
      title: title,
      number: number,
      image: image,
      description: description,
      chartData: chartData,
    );
  }

  static List<StateItem> statesList = [
    // Example of using the factory method to create a StateItem with chart data
    StateItem.withChartData(
      title: "اجمالي عدد المبادرات",
      number: "150",
      //image: "first_image_url",
      description: "بنسبة زيادة 50%",
      chartData: LineChartData(
          // Customize chart data
          // Example: Include StateItem.statesList[index].number in the data
          ),
    ),
    // Add more items for other boxes

    StateItem.withChartData(
      title: "عدد المبادرات الحالية",
      number: "100",
      //image: "first_image_url",
      description: "Description for the first box",
      chartData: LineChartData(
          // Customize chart data
          // Example: Include StateItem.statesList[index].number in the data
          ),
    ),
    // Add more items for other boxes

    StateItem.withChartData(
      title: "أكثر من ",
      number: "100",
      //image: "first_image_url",
      description: "Description for the first box",
      chartData: LineChartData(
          // Customize chart data
          // Example: Include StateItem.statesList[index].number in the data
          ),
    ),
    // Add more items for other boxes

    StateItem.withChartData(
      title: "اكثر من 1700 مستخدم",
      number: "100",
      //image: "first_image_url",
      description: "Description for the first box",
      chartData: LineChartData(
          // Customize chart data
          // Example: Include StateItem.statesList[index].number in the data
          ),
    ),
    // Add more items for other boxes
  ];
}

class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  BarData({
    required this.friAmount,
    required this.monAmount,
    required this.satAmount,
    required this.sunAmount,
    required this.thurAmount,
    required this.tueAmount,
    required this.wedAmount,
  });
  List<IndividualBar> barData = [];
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 1, y: monAmount),
      IndividualBar(x: 2, y: tueAmount),
      IndividualBar(x: 3, y: wedAmount),
      IndividualBar(x: 4, y: thurAmount),
      IndividualBar(x: 5, y: friAmount),
      IndividualBar(x: 6, y: satAmount),
    ];
  }
}
