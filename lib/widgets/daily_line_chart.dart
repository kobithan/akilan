import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';

class DailyLineChart extends StatefulWidget {
  const DailyLineChart({Key? key}) : super(key: key);

  @override
  _DailyLineChartState createState() => _DailyLineChartState();
}

class _DailyLineChartState extends State<DailyLineChart> {
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CalorieProgress>(context, listen: false);

    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 10.0),
                  child: Container(
                    height: 300,
                    width: 425,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade900,
                        borderRadius: BorderRadius.circular(18.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 300,
                        child: LineChart(
                          LineChartData(
                              borderData: FlBorderData(show: false),
                              titlesData: FlTitlesData(
                                //leftTitles: SideTitles(showTitles: true),
                               // rightTitles: SideTitles(showTitles: false),
                                //topTitles: SideTitles(showTitles: false),
                                // bottomTitles: SideTitles(
                                //   showTitles: true,
                                //   /*getTextStyles: (value) => TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.bold
                                //   ),*/
                                //   getTitles: (value) {
                                //     switch (value.toInt()) {
                                //       case 1:
                                //         return 'Mon';
                                //       case 2:
                                //         return 'Tues';
                                //       case 3:
                                //         return 'Wed';
                                //       case 4:
                                //         return 'Thu';
                                //       case 5:
                                //         return 'Fri';
                                //       case 6:
                                //         return 'Sat';
                                //       case 7:
                                //         return 'Sun';
                                //     }
                                //     return '';
                                //   },
                                // ),
                                // leftTitles: SideTitles(
                                //   interval: 4,
                                //   showTitles: true,
                                //   /*getTextStyles: (value) => TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 14,
                                //       fontWeight: FontWeight.bold
                                //   ),*/
                                //   getTitles: (value) {
                                //     if(value.toInt() == 0) return '';
                                //     else return value.toInt().toString();
                                //   },
                                // ),
                              ),
                              lineBarsData: [
                            LineChartBarData(spots: [
                              const FlSpot(0, 0),
                              const FlSpot(1, 3),
                              const FlSpot(2, 10),
                              const FlSpot(3, 7),
                              const FlSpot(4, 12),
                              const FlSpot(5, 13),
                              const FlSpot(6, 17),
                              const FlSpot(7, 15)
                            ])
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    width: 450,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(25.0)
                    ),
                    child:
                        Row(
                          children:  [
                            Text("Daily Calories Burnt - AVERAGE -  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,

                            ),),
                            Text(user.progress.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                              fontWeight: FontWeight.w800,
                            )),
                          ],
                        ),

                    ),
              ],
            ),
          ),
        ],
      ),
    );

    /*return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(showTitles: true),
                leftTitles: SideTitles(showTitles: true),
                rightTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
              ),
              lineBarsData: [
                // The red line
                LineChartBarData(
                  spots: dummyData1,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.red,
                  ],
                ),
                // The orange line
                LineChartBarData(
                  spots: dummyData2,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.lightBlue,
                  ],
                ),
                // The blue line
                LineChartBarData(
                  spots: dummyData3,
                  isCurved: true,
                  barWidth: 3,
                  colors: [
                    Colors.lightGreenAccent.shade100,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
