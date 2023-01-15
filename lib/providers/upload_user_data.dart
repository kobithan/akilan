import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';

class UploadUserData with ChangeNotifier {
  String? _gender;
  String? _userHeight;
  String? _userWeight;
  String? _activityLevel;
  String? _userGoal;
  String? _goalAmount;
  String? _timePeriod;
  String? _userModelName;

  set userModelName(String value) {
    _userModelName = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set userHeight(String value) {
    _userHeight = value;
  }

  set userWeight(String value) {
    _userWeight = value;
  }

  set activityLevel(String value) {
    _activityLevel = value;
  }

  set userGoal(String value) {
    _userGoal = value;
  }

  set goalAmount(String value) {
    _goalAmount = value;
  }

  set timePeriod(String value) {
    _timePeriod = value;
  }

  Future<void> uploadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (_gender != null &&
        _userHeight != null &&
        _userWeight != null &&
        _activityLevel != null &&
        _userGoal != null &&
        _userModelName != null) {
      await FirebaseFirestore.instance
          .collection("Shape-Shifter-Fitness-Users")
          .doc(user?.uid)
          .update(
        {
          'Gender': _gender,
          'User-Height': _userHeight,
          'User-Weight': _userWeight,
          'Activity-Level': _activityLevel,
          'User-Goal': _userGoal,
          'Goal-Amount': _goalAmount,
          'Time-Period': _timePeriod,
          'User-3D-Model-Name': _userModelName,
        },
      );
    }
  }

  Future<void> uploadAppData(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    final calMeter = Provider.of<CalorieProgress>(context, listen: false);

      await FirebaseFirestore.instance
          .collection("User-App-Data")
          .doc(user?.uid)
          .update(
        {
          'UID': user?.uid,
          'Workout-Total-Cal': calMeter.leftAmount.toDouble(),
          'Workout-Burnt-Cal': calMeter.progress.toDouble(),
          'Diet-Total-Cal': calMeter.dietCalLeftAmount.toDouble(),
          'Protein': calMeter.protein.toDouble(),
          'Carb': calMeter.carbs.toDouble(),
          'Fat': calMeter.fat.toDouble(),
          'TookCarb' : calMeter.tookCarbs.toDouble(),
          'tookProtein' : calMeter.tookProtein.toDouble(),
          'tookFat' : calMeter.tookFat.toDouble(),
        },
      );
    }
  }
