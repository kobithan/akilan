import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadUserData with ChangeNotifier {
  String? _userID;
  String? _firstName;
  String? _lastName;
  String? _age;
  String? _mobileNumber;
  String? _email;
  String? _gender;
  String? _userHeight;
  String? _userWeight;
  String? _activityLevel;
  String? _userGoal;
  String? _goalAmount;
  String? _timePeriod;
  String? _modelName;
  bool? _googleUser;
  bool? _shapeShifterUser;
  List? _dynamicDataList;
  List? _dynamicDataList1;

  List? get dynamicDataList1 => _dynamicDataList1;
  List? _dynamicDataList2;
  Map? _calorieData;
  double? _carb;

  double? get carb => _carb;

  double? _dietTotalCal;
  double? _fat;
  double? _protein;
  double? _workoutBurnCal;
  double? _workoutTotalCal = 0;
  double? _tookCarb;
  double? _tookProtein;
  double? _tookFat;

  String? _dailyCalIntake;

  String? get dailyCalIntake => _dailyCalIntake;
  String? _dailyCalCarb;
  String? _dailyCalProtein;
  String? _dailyCalFat;

  var _isLoading = false;

  List? get dynamicDataList => _dynamicDataList;

  Map? get calorieData => _calorieData;

  get isLoading => _isLoading;

  String? get userID => _userID;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get age => _age;

  String? get mobileNumber => _mobileNumber;

  String? get email => _email;

  String? get gender => _gender;

  String? get userHeight => _userHeight;

  String? get userWeight => _userWeight;

  String? get activityLevel => _activityLevel;

  String? get userGoal => _userGoal;

  String? get goalAmount => _goalAmount;

  String? get timePeriod => _timePeriod;

  String? get modelName => _modelName;

  bool? get googleUser => _googleUser;

  bool? get shapeShifterUser => _shapeShifterUser;

  Future readUser() async {
    _isLoading = true;
    notifyListeners();

    User? data = FirebaseAuth.instance.currentUser;
    final userData = FirebaseFirestore.instance
        .collection('Shape-Shifter-Fitness-Users')
        .doc(data?.uid);
    final snapshot = await userData
        .get()
        .then((value) => value.data() as Map<String, dynamic>);

    _userID = snapshot['UID'];
    _firstName = snapshot['FirstName'];
    _lastName = snapshot['LastName'];
    _age = snapshot['Age'];
    _mobileNumber = snapshot['Mobile'];
    _email = snapshot['Email'];
    _gender = snapshot['Gender'];
    _userHeight = snapshot['User-Height'];
    _userWeight = snapshot['User-Weight'];
    _activityLevel = snapshot['Activity-Level'];
    _userGoal = snapshot['User-Goal'];
    _goalAmount = snapshot['Goal-Amount'];
    _timePeriod = snapshot['Time-Period'];
    _modelName = snapshot['User-3D-Model-Name'];
    _googleUser = snapshot['Google-User'];
    _shapeShifterUser = snapshot['Shape-Shifter-User'];

    _isLoading = false;
    notifyListeners();
  }

  Future readAppData() async {

    User? data = FirebaseAuth.instance.currentUser;
    final userData = FirebaseFirestore.instance
        .collection('User-App-Data')
        .doc(data?.uid);
    final snapshot = await userData
        .get()
        .then((value) => value.data() as Map<String, dynamic>);

    _workoutTotalCal = snapshot['Workout-Total-Cal'];
    _dietTotalCal = snapshot['Diet-Total-Cal'];
    _workoutBurnCal = snapshot['Workout-Burnt-Cal'];
    _protein = snapshot['Protein'];
    _carb = snapshot['Carb'];
    _fat = snapshot['Fat'];
    _tookCarb = snapshot['TookCarb'];
    _tookProtein = snapshot['tookProtein'];
    _tookFat = snapshot['tookFat'];

    print(snapshot);

    notifyListeners();
  }

  Future <void> changeActivity () async {

    if (_activityLevel == "Sedentary") {
      _activityLevel = "sedentary";
    }
    else if (_activityLevel == "Light activity") {
      _activityLevel = "lightactive";
    }
    else if (_activityLevel == "Moderately active") {
      _activityLevel = "moderatelyactive";
    }
    else if (_activityLevel == "Active") {
      _activityLevel = "active";
    }
    else if (_activityLevel == "Very active") {
      _activityLevel = "veryactive";
    }
  }

  Future <void> changeGoal () async {
    if (_userGoal == "Gain") {
      _userGoal = "gain";
    }
    else if (_userGoal == "Lose") {
      _userGoal = "lose";
    }
    else if (_userGoal == "Maintain") {
      _userGoal = "maintain";
    }
  }
  Future <void> changeGender () async {
    if (_gender == "Male") {
      _gender = "male";
    }
    else if (_gender == "Female") {
      _gender = "female";
    }
  }


  Future <void> readUserCalorieData () async {

    print(_activityLevel);
    print(_userGoal);

    final url = 'https://shape-shifter-calories.herokuapp.com/user-bmr-amr-details?weight=$_userWeight&height=$_userHeight&gender=$_gender&years=$_age&activity_level=$_activityLevel&goal=$_userGoal&goal_weight=$_goalAmount&weeks=$_timePeriod';
    print(url);
    final response = await http.get(Uri.parse(url));

    final dataMap = json.decode(response.body) as Map <dynamic, dynamic>;

    _calorieData = dataMap['data'] as Map <String, dynamic>;



    _dailyCalIntake = _calorieData!['daily_calorie_intake'].toString();
    _dailyCalCarb = _calorieData!['daily_calorie_intake_by_carb'].toString();
    _dailyCalProtein = _calorieData!['daily_calorie_intake_by_protein'].toString();
    _dailyCalFat = _calorieData!['daily_calorie_intake_by_fat'].toString();

    print(_dailyCalIntake);
    print(_dailyCalProtein);

    print("_calorieData! $calorieData");

  }


  Future <void> readUserDietPlan () async {

    final url = 'https://us-central1-shape-shifter-fitness-e89b7.cloudfunctions.net/test1/api/bfcalculation?daily_calorie_intake=$_dailyCalIntake&daily_calorie_intake_by_carb=$_dailyCalCarb&daily_calorie_intake_by_protein=$_dailyCalProtein&daily_calorie_intake_by_fat=$_dailyCalFat';

    final response = await http.get(Uri.parse(url));

    final dynamicData = json.decode(response.body);

    _dynamicDataList = dynamicData [0] as List <dynamic>;

    for (int i = 0; i < _dynamicDataList!.length; i++) {

      final dietPlan = dynamicDataList![i] as Map<String, dynamic>;

      print(dietPlan);

    }
  }

  Future <void> readUserDietPlanLunch () async {

    final url = 'https://us-central1-shape-shifter-fitness-e89b7.cloudfunctions.net/test1/api/lucalculation?daily_calorie_intake=$_dailyCalIntake&daily_calorie_intake_by_carb=$_dailyCalCarb&daily_calorie_intake_by_protein=$_dailyCalProtein&daily_calorie_intake_by_fat=$_dailyCalFat';

    final response = await http.get(Uri.parse(url));

    final dynamicData = json.decode(response.body);

    _dynamicDataList1 = dynamicData [0] as List <dynamic>;

    for (int i = 0; i < _dynamicDataList!.length; i++) {

      final dietPlan = dynamicDataList![i] as Map<String, dynamic>;

      print(dietPlan);

    }
  }

  Future <void> readUserDietPlanDinner () async {

    final url = 'https://us-central1-shape-shifter-fitness-e89b7.cloudfunctions.net/test1/api/dicalculation?daily_calorie_intake=$_dailyCalIntake&daily_calorie_intake_by_carb=$_dailyCalCarb&daily_calorie_intake_by_protein=$_dailyCalProtein&daily_calorie_intake_by_fat=$_dailyCalFat';

    final response = await http.get(Uri.parse(url));

    final dynamicData = json.decode(response.body);

    _dynamicDataList2 = dynamicData [0] as List <dynamic>;

    for (int i = 0; i < _dynamicDataList!.length; i++) {

      final dietPlan = dynamicDataList![i] as Map<String, dynamic>;

      print(dietPlan);

    }
  }

  double? get dietTotalCal => _dietTotalCal;

  double? get fat => _fat;

  double? get protein => _protein;

  double? get workoutBurnCal => _workoutBurnCal;

  double? get workoutTotalCal => _workoutTotalCal;

  double? get tookCarb => _tookCarb;

  double? get tookProtein => _tookProtein;

  double? get tookFat => _tookFat;

  List? get dynamicDataList2 => _dynamicDataList2;

  String? get dailyCalCarb => _dailyCalCarb;

  String? get dailyCalProtein => _dailyCalProtein;

  String? get dailyCalFat => _dailyCalFat;
}
