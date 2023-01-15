import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthlyLineChart extends StatefulWidget {
  const MonthlyLineChart({Key? key}) : super(key: key);

  @override
  _MonthlyLineChartState createState() => _MonthlyLineChartState();
}

class _MonthlyLineChartState extends State<MonthlyLineChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
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
                              // topTitles: SideTitles(showTitles: false),
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
                              //         return 'M 1';
                              //       case 2:
                              //         return 'M 2';
                              //       case 3:
                              //         return 'M 3';
                              //       case 4:
                              //         return 'M 4';
                              //       case 5:
                              //         return 'M 5';
                              //       case 6:
                              //         return 'M 6';
                              //       case 7:
                              //         return 'M 7';
                              //       case 8:
                              //         return 'M 8';
                              //       case 9:
                              //         return 'M 9';
                              //       case 10:
                              //         return 'M 10';
                              //       case 11:
                              //         return 'M 11';
                              //       case 12:
                              //         return 'M 12';
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
                            const FlSpot(0, 1),
                            const FlSpot(1, 3),
                            const FlSpot(2, 10),
                            const FlSpot(3, 7),
                            const FlSpot(4, 5),
                            const FlSpot(5, 6),
                            const FlSpot(6, 2),
                            const FlSpot(7, 15),
                            const FlSpot(8, 20)
                          ])
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
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
              children: const [
                Text("Daily Calories Burnt - AVERAGE -",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,

                  ),),
                Text(" No. of cals burnt",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    )),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
