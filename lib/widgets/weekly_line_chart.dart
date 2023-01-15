import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';

class WeeklyLineChart extends StatefulWidget {
  const WeeklyLineChart({Key? key}) : super(key: key);

  @override
  _WeeklyLineChartState createState() => _WeeklyLineChartState();
}

class _WeeklyLineChartState extends State<WeeklyLineChart> {
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
                              // bottomTitles: SideTitles(showTitles: true),
                              // leftTitles: SideTitles(showTitles: true),
                              // rightTitles: SideTitles(showTitles: false),
                              // topTitles: SideTitles(showTitles: false),
                            ),
                            lineBarsData: [
                          LineChartBarData(spots: [
                            const FlSpot(0, 1),
                            const FlSpot(1, 1),
                            const FlSpot(2, 4),
                            const FlSpot(3, 7),
                            const FlSpot(4, 15),
                            const FlSpot(5, 13),
                            const FlSpot(6, 1),
                            const FlSpot(7, 15),
                            const FlSpot(8, 2)
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
              children:  [
                Text("Daily Calories Burnt - AVERAGE -",
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
    );
  }
}
