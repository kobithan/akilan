import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../widgets/daily_line_chart.dart';
import '../widgets/monthly_line_chart.dart';
import '../widgets/weekly_line_chart.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          //backgroundColor: Colors.black26,
          backgroundColor: Colors.blueGrey[50],
          appBar: AppBar(
              backgroundColor: Colors.blue.shade800,
              elevation: 0,
              title: const Text('Statistics',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),),
              centerTitle: true,

              bottom: const TabBar(tabs: [
                Tab(text: 'Daily', ),
                Tab(text: 'Weekly'),
                Tab(text: 'Monthly'),
              ],),

          ),
          body: const TabBarView(
            children: [
              DailyLineChart(),
              WeeklyLineChart(),
              MonthlyLineChart(),
            ],),
        ),
      );

  }
}
