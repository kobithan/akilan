import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calculate_3d_model.dart';
import 'package:shape_shifter_fitness_application/providers/read_user_data.dart';
import 'package:shape_shifter_fitness_application/providers/upload_user_data.dart';

class CalorieProgress with ChangeNotifier {
  final String _ingredient = "";
   double leftAmount=0;
  double dietCalLeftAmount=0;
  double protein = 0;
  double carbs = 0;
  double fat = 0;
  double tookProtein = 0;
  double tookCarbs = 0;
  double tookFat = 0;

  var isLogged = false;

  double progress = 0;
  final Color _progressColor = Colors.pink;

  String get ingredient => _ingredient;

  Color get progressColor => _progressColor;

/*void functionName(){
    //process goes here
    notifyListeners();
  }*/

Future  startApplication (BuildContext context) async {

  isLogged = true;
  notifyListeners();

  final user = Provider.of<ReadUserData>(context, listen: false);
  await user.readUser();
  await Provider.of<Calculate3DModel>(context, listen: false)
      .calculate3DBodyType(context);
  await user.changeActivity();
  await user.changeGender();
  await user.changeGoal();
  await user.readUserCalorieData();
  await user.readUserDietPlan();
  await user.readUserDietPlanLunch();
  await user.readUserDietPlanDinner();
  await user.readAppData();
  final calMeter = Provider.of<CalorieProgress>(context, listen: false);
  calMeter.leftAmount = user.workoutTotalCal!;
  calMeter.dietCalLeftAmount = user.dietTotalCal!;
  protein = user.protein!.toDouble();
  tookProtein = user.tookProtein!.toDouble();
  carbs = user.carb!.toDouble();
  tookCarbs = user.tookCarb!.toDouble();
  fat = user.fat!.toDouble();
  tookFat = user.tookFat!.toDouble();
  progress = user.workoutBurnCal!.toDouble();
  if (user.workoutTotalCal == 0) {
    int calAmount = user.calorieData!['daily_calorie_burn_by_workout'];
    calMeter.leftAmount = calAmount.toDouble();
    calMeter.dietCalLeftAmount = user.calorieData!['daily_calorie_intake'];
    calMeter.protein = user.calorieData!['daily_calorie_intake_by_protein'];
    calMeter.carbs = user.calorieData!['daily_calorie_intake_by_carb'];
    calMeter.fat = user.calorieData!['daily_calorie_intake_by_fat'];
  }
  await Provider.of<UploadUserData>(context, listen: false).uploadAppData(context);
  await user.readAppData();
  calMeter.leftAmount = user.workoutTotalCal!;
  calMeter.dietCalLeftAmount = user.dietTotalCal!;
  protein = user.protein!.toDouble();
  tookProtein = user.tookProtein!.toDouble();
  carbs = user.carb!.toDouble();
  tookCarbs = user.tookCarb!.toDouble();
  fat = user.fat!.toDouble();
  tookFat = user.tookFat!.toDouble();
  progress = user.workoutBurnCal!.toDouble();

  isLogged = false;
  notifyListeners();
}

}
