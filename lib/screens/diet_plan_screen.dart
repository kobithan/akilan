import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/widgets/diet_plan.dart';
import 'package:sizer/sizer.dart';

class DietPlanScreen extends StatelessWidget {
  static const routeName = '/DietPlanScreen';

  const DietPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, List?>;

   List? dietPlans = routeArguments['dietDetails'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20.sp,
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final data = dietPlans![index] as Map<String, dynamic>;
          return DietPlans(
            data['Food'],
            data['PhotoURL'],
            data['AmountPer'],
            data['Calories'].toString(),
            index,
          );
        },
        itemCount: dietPlans!.length,
      ),
    );
  }
}
