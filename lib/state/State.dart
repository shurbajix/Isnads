import 'dart:math' as Math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:isnad/state/State_class.dart';

import 'state_items.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Text(
            'تقارير و احصائات',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoKufiArabic',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Color(0xff120D26),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            //lastItems(myBarData: myBarData),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: StateItem.statesList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Widget containerItem;

                  // Determine which item to show based on the index
                  if (index == 0) {
                    containerItem = const Seconditems();
                  } else if (index == 1) {
                    containerItem = const Thirditems();
                  } else if (index == 2) {
                    containerItem = const Seconditems();
                    // You can customize this based on your needs
                  } else {
                    containerItem = const Seconditems();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 22,
                      left: 22,
                      bottom: 20,
                      top: 20,
                    ),
                    child: Container(
                      width: 327.w,
                      height: 231.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          containerItem,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// add all items here 

// be cafrel these are important 


// this for the first chart but not finish yet
// Stack(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Positioned(
//                                 top: 60,
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "150",
//                                       style: TextStyle(
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       "مبادرة",
//                                       style: TextStyle(
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     'اجمالي عدد المبادرات',
//                                     style: TextStyle(
//                                       fontFamily: 'NotoKufiArabic',
//                                       fontSize: 24,
//                                     ),
//                                   ),
//                                   Text(
//                                     "بنسبة زيادة 50%",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Expanded(
//                             child: LineChart(
//                               LineChartData(
//                                 borderData: FlBorderData(
//                                   show: true,
//                                   border: Border.all(
//                                     color: const Color(0xff37434d),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 gridData: FlGridData(
//                                   show: false,
//                                   getDrawingHorizontalLine: (value) {
//                                     return const FlLine(
//                                       color: Color(0xff37434d),
//                                       strokeWidth: 5,
//                                     );
//                                   },
//                                   drawVerticalLine: false,
//                                 ),
//                                 minX: 0,
//                                 maxX: 10,
//                                 minY: 0,
//                                 maxY: 6,
//                                 lineBarsData: [
//                                   LineChartBarData(
//                                     isCurved: true,
//                                     color: gredentscolor,
//                                     barWidth: 5,
//                                     belowBarData: BarAreaData(
//                                       show: true,
//                                       color: gredentscolor
//                                           .map(
//                                               (color) => color.withOpacity(0.8))
//                                           .toList(),
//                                     ),
//                                     spots: [
//                                       const FlSpot(0, 3),
//                                       const FlSpot(2.6, 2),
//                                       const FlSpot(4.9, 5),
//                                       const FlSpot(6.8, 2.5),
//                                       const FlSpot(8, 4),
//                                       const FlSpot(9.5, 3),
//                                       const FlSpot(11, 4),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
// this is cricle chart
//  Text(
//                             'عدد المبادرات الحالية',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 24,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: 'NotoKufiArabic',
//                             ),
//                           ),
// Expanded(
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               SfCircularChart(
//                                 series: <CircularSeries>[
//                                   RadialBarSeries<ChartData, String>(
//                                     dataSource: chartData,
//                                     xValueMapper: (ChartData data, _) =>
//                                         data.x,
//                                     yValueMapper: (ChartData data, _) =>
//                                         data.y,
//                                     innerRadius: '50%',
//                                     cornerStyle: CornerStyle.bothCurve,
//                                     radius: '90%',
//                                   ),
//                                 ],
//                               ),
//                               const Positioned.fill(
//                                 child: Center(
//                                   child: Text(
//                                     '30',
//                                     style: TextStyle(
//                                       fontSize: 40,
//                                       fontWeight: FontWeight.bold,
//                                       fontFamily: 'NotoKufiArabic',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
// class ChartData {
//   ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }
//  final List<ChartData> chartData = [
//     ChartData('David', 60),
//     ChartData('Steve', 88),
//     ChartData('Jack', 66),
//     ChartData('Others', 280)
//   ];
/// this end for the first one circle chart
// this will remove or add
//  Expanded(
//                             child: Center(
//                               child: Stack(
//                                 children: [
//                                   // Outer circle
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: PieChart(
//                                       PieChartData(
//                                         sections: [
//                                           PieChartSectionData(
//                                             value: 25,
//                                             color: Colors.greenAccent,
//                                             radius: 45,
//                                           ),
//                                           PieChartSectionData(
//                                             value: 20,
//                                             color: Colors.blue,
//                                             radius: 25,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   // Inner circle
//                                   const SizedBox(
//                                     width: 20,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: PieChart(
//                                       PieChartData(
//                                         sections: [
//                                           PieChartSectionData(
//                                             value:
//                                                 20, // Set the value to 0 to create a complete circle
//                                             color: Colors
//                                                 .yellow, // Make it transparent
//                                             radius: 20,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 20,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: PieChart(
//                                       PieChartData(
//                                         sections: [
//                                           PieChartSectionData(
//                                             value:
//                                                 10, // Set the value to 0 to create a complete circle
//                                             color: Colors
//                                                 .yellowAccent, // Make it transparent
//                                             radius: 12,
//                                           ),
//                                           PieChartSectionData(
//                                             value: 4,
//                                             color: Colors.blueGrey,
//                                             radius: 4,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
// this for some of the box
// Stack(
//                         //crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: 197,
//                                 height: 195,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                       'assets/images/Goal.png',
//                                     ),
//                                   ),
//                                 ),
//                                 child: const Column(
//                                   children: [],
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.only(
//                                   bottom: 130,
//                                   right: 24,
//                                 ),
//                                 child: Text(
//                                   "أكثر من ",
//                                   style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Positioned(
//                             right: 10,
//                             left: 5,
//                             top: 50,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment
//                                   .start, // Align children at the top
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   '43',
//                                   style: TextStyle(
//                                     fontSize: 96,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   'فارس',
//                                   style: TextStyle(
//                                     fontSize: 48,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
// this is important
// Padding(
//                             padding: const EdgeInsets.only(
//                               bottom: 10,
//                               right: 15,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   width: 197,
//                                   height: 195,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         'assets/images/Goal.png',
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       "اجمالي عدد المبادرات",
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         fontSize: 24.sp,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       'بنسبة زيادة 50%',
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
// this for last box
// SizedBox(
//                             height: 210,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 bottom: 10,
//                               ),
//                               child: BarChart(
//                                 BarChartData(
//                                   maxY: 120,
//                                   minY: 0,
//                                   gridData: const FlGridData(show: false),
//                                   borderData: FlBorderData(show: false),
//                                   titlesData: const FlTitlesData(
//                                     show: false,
//                                     topTitles: AxisTitles(
//                                       sideTitles: SideTitles(
//                                         showTitles: false,
//                                       ),
//                                     ),
//                                     leftTitles: AxisTitles(
//                                       sideTitles: SideTitles(showTitles: false),
//                                     ),
//                                     rightTitles: AxisTitles(
//                                       sideTitles: SideTitles(
//                                         showTitles: false,
//                                       ),
//                                     ),
//                                   ),
//                                   barGroups: myBarData.barData
//                                       .map(
//                                         (data) => BarChartGroupData(
//                                           x: data.x,
//                                           barRods: [
//                                             BarChartRodData(
//                                               toY: data.y,
//                                               color: Colors.grey[800],
//                                               width: 25,
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                               backDrawRodData:
//                                                   BackgroundBarChartRodData(
//                                                 show: true,
//                                                 toY: 100,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               ),
//                             ),
//                           ),
