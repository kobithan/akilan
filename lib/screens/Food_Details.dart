import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/widgets/diet_plan.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../providers/read_user_data.dart';

class FoodDetails extends StatelessWidget {
  static const routeName = '/FoodDetailsScreen';

  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final index = routeArguments['index'];
    final meal =
        Provider.of<ReadUserData>(context, listen: false).dynamicDataList;
    final mealData = meal![index] as Map<String, dynamic>;

    Widget _details(String detail, String data) => Padding(
      padding: EdgeInsets.all(1.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(fontSize: 12.sp),
          ),
          Text(
            detail,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          mealData['Food'],
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  mealData['PhotoURL'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            _details(mealData['Food'], "Food Name : "),
            _details(mealData['AmountPer'], "Amount Per Serve : "),
            _details(mealData['Calories'].toString(), "Total Calories : "),
            _details(mealData['TotalCarbohydrate'], "Total Carbohydrate"),
            _details(mealData['Protein'], "Total Protein"),
            _details(mealData['TotalFat'], "Total Fat"),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
