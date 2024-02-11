// this for the third items
import 'dart:math' as Math;

import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'State_class.dart';

class Thirditems extends StatefulWidget {
  const Thirditems({
    super.key,
  });

  @override
  State<Thirditems> createState() => _ThirditemsState();
}

class _ThirditemsState extends State<Thirditems> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  final Math.Random _random = Math.Random();
  late List<CircularStackEntry> chartDatasize;
  late List<double> weeklySummary;
  List<double> weeklySummarys = [
    4.40,
    2.50,
    5.40,
    10.20,
    45.50,
    100.20,
    88.90,
    77.00
  ];

  @override
  void initState() {
    super.initState();

    chartDatasize = _generateRandomData();
    weeklySummary = List.from(weeklySummarys);
  }

  void _randoms() {
    setState(() {
      chartDatasize = _generateRandomData();
    });
  }

  List<CircularStackEntry> _generateRandomData() {
    List<CircularStackEntry> chartData =
        List.generate(StateItem.statesList.length, (index) {
      Color randomColor = ColorPalette.getProperty(_random);
      int segmentCount = 16; // You can adjust this count as needed
      List<CircularSegmentEntry> segment = List.generate(segmentCount, (j) {
        return CircularSegmentEntry(
          _random.nextDouble(),
          randomColor,
          rankKey: 'segment_$j',
        );
      });

      return CircularStackEntry(
        segment,
        rankKey: 'stack_$index',
      );
    });

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      friAmount: weeklySummarys,
      monAmount: weeklySummarys,
      satAmount: weeklySummarys,
      sunAmount: weeklySummarys,
      thurAmount: weeklySummarys,
      tueAmount: weeklySummarys,
      wedAmount: weeklySummarys,
    );
    myBarData.initializeBarData();
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 197,
              height: 195,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Goal.png',
                  ),
                ),
              ),
              child: const Column(
                children: [],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 130,
                right: 24,
              ),
              child: Text(
                "أكثر من ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const Positioned(
          right: 10,
          left: 5,
          top: 50,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align children at the top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '43',
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'فارس',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// this for the second items
class Seconditems extends StatelessWidget {
  const Seconditems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfCircularChart(
            series: <CircularSeries>[
              RadialBarSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                innerRadius: '50%',
                cornerStyle: CornerStyle.bothCurve,
                radius: '90%',
              ),
            ],
          ),
          const Positioned.fill(
            child: Center(
              child: Text(
                '30',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoKufiArabic',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData('David', 60),
  ChartData('Steve', 88),
  ChartData('Jack', 66),
  ChartData('Others', 280)
];

// this for the last itemes that container
class LastItems extends StatelessWidget {
  const LastItems({
    super.key,
    required this.myBarData,
  });

  final BarData myBarData;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: StateItem.statesList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
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
                  SizedBox(
                    height: 210,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: BarChart(
                        BarChartData(
                          maxY: 120,
                          minY: 0,
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: const FlTitlesData(
                            show: false,
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                          ),
                          barGroups: myBarData.barData,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorPalette {
  static final ColorPalette _palette = ColorPalette(
    <Color>[
      const Color(0xffC41a3b),
      const Color(0Xfffbe0e6),
      const Color(0xff1b1f32),
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.purple,
    ],
  );

  ColorPalette(List<Color> colors) : _color = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color> _color;
  Color operator [](int index) => _color[index % _length];
  int get _length => _color.length;
  Color _random(Math.Random random) => this[random.nextInt(_length)];

  static Color getProperty(Math.Random random) {
    return _palette._random(random);
  }
}

class BarData {
  final List<double> friAmount;
  final List<double> monAmount;
  final List<double> satAmount;
  final List<double> sunAmount;
  final List<double> thurAmount;
  final List<double> tueAmount;
  final List<double> wedAmount;

  BarData({
    required this.friAmount,
    required this.monAmount,
    required this.satAmount,
    required this.sunAmount,
    required this.thurAmount,
    required this.tueAmount,
    required this.wedAmount,
  });

  late List<BarChartGroupData> barData;

  void initializeBarData() {
    barData = List.generate(friAmount.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: friAmount[index],
            color: Colors.grey[800],
            width: 25,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
            ),
          ),
        ],
      );
    });
  }
}
