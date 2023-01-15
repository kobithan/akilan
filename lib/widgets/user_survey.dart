import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

import '../widgets/rounded_buttons.dart';
import '../providers/upload_user_data.dart';
import '../screens/verify_email_screen.dart';

class UserSurvey extends StatefulWidget {
  const UserSurvey({Key? key}) : super(key: key);

  @override
  State<UserSurvey> createState() => _UserSurveyState();
}

class _UserSurveyState extends State<UserSurvey> {
  double _userHeight = 0;
  double _userWeight = 0;
  double _userWeightAmount = 0;
  double _userGoalPeriod = 0;

  final ScrollController _scrollController = ScrollController();

  final List<String> _activityLevel = [
    "Sedentary",
    "Light activity",
    "Moderately active",
    "Active",
    "Very active",
    "Select Your Activity Level",
  ];
  final List<String> _weightGoal = [
    "Gain",
    "Lose",
    "Maintain",
    "Select Your Goal"
  ];

  String? _selectedItem = "Select Your Activity Level";
  String? _selectedGoal = "Select Your Goal";

  Widget question(String question) => Container(
        padding: EdgeInsets.only(left: 2.4.h, right: 2.4.h),
        child: Text(
          question,
          style: TextStyle(fontSize: 14.sp),
        ),
      );

  Widget value(double value, String text) => Padding(
        padding: EdgeInsets.only(left: 2.4.h, right: 2.4.h),
        child: Container(
          height: 6.4.h,
          decoration: BoxDecoration(
            //color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 0.3.w)
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            child: Text(
              "${value.toStringAsFixed(1)} $text",
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      );

  Timer? _timer;

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _scrollToBottom(){
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        _scrollToBottom();
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final uploadUserData = Provider.of<UploadUserData>(context, listen: false);

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.all(1.5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            question('1 .Select Your Height In Centimetres (CM) ?'),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 0.7.h,
              ),
              child: Slider(
                activeColor: Theme.of(context).errorColor,
                inactiveColor: Colors.black87,
                value: _userHeight,
                onChanged: (newUserHeight) {
                  setState(
                    () {
                      _userHeight = newUserHeight;
                    },
                  );
                },
                min: 0,
                max: 250,
              ),
            ),
            value(_userHeight, 'CM'),
            SizedBox(
              height: 2.h,
            ),
            question('2 .Select Your Weight In Kilograms (KG) ?'),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 0.7.h,
              ),
              child: Slider(
                activeColor: Theme.of(context).errorColor,
                inactiveColor: Colors.black87,
                value: _userWeight,
                onChanged: (newUserWeight) {
                  setState(
                    () {
                      _userWeight = newUserWeight;
                    },
                  );
                },
                min: 0,
                max: 150,
              ),
            ),
            value(_userWeight, 'KG'),
            SizedBox(
              height: 2.h,
            ),
            question('3 .How Would You Describe Your Activity Level ?'),
            Container(
              padding: EdgeInsets.only(
                left: 2.4.h,
                right: 2.4.h,
                top: 1.h,
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 0.3.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.3.w),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                value: _selectedItem,
                items: _activityLevel
                    .map(
                      (items) => DropdownMenuItem<String>(
                        value: items,
                        child: Text(
                          items, style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (items) {
                  setState(
                    () {
                      _selectedItem = items.toString();
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            question('4 .Do You Want To Gain, Lose Or Maintain Weight ?'),
            Container(
              padding: EdgeInsets.only(
                left: 2.4.h,
                right: 2.4.h,
                top: 1.h,
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 0.3.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.3.w),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                value: _selectedGoal,
                items: _weightGoal
                    .map(
                      (items) => DropdownMenuItem<String>(
                        value: items,
                        child: Text(
                          items, style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (items) {
                  setState(
                    () {
                      _selectedGoal = items.toString();
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            _selectedGoal == "Lose" || _selectedGoal == "Gain"
                ? Column(
                    children: [
                      question(_selectedGoal == "Gain"
                          ? '5 .How Much Weight Do You Want To Gain ?'
                          : '5 .How Much Weight Do You Want To Lose ?'),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 0.7.h,
                        ),
                        child: Slider(
                          activeColor: Theme.of(context).errorColor,
                          inactiveColor: Colors.black87,
                          value: _userWeightAmount,
                          onChanged: (newUserWeight) {
                            setState(
                              () {
                                _userWeightAmount = newUserWeight;
                              },
                            );
                          },
                          min: 0,
                          max: 100,
                        ),
                      ),
                      value(_userWeightAmount, 'KG'),
                      SizedBox(
                        height: 2.h,
                      ),
                      question(
                          '6 .In What Period Of Time Do You Want To Attain Your Goal ?'),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 0.7.h,
                        ),
                        child: Slider(
                          activeColor: Theme.of(context).errorColor,
                          inactiveColor: Colors.black87,
                          value: _userGoalPeriod,
                          onChanged: (newUserWeight) {
                            setState(
                              () {
                                _userGoalPeriod = newUserWeight;
                              },
                            );
                          },
                          min: 0,
                          max: 12,
                          divisions: 12,
                        ),
                      ),
                      value(_userGoalPeriod, 'Month'),
                    ],
                  )
                : const SizedBox(),
            _selectedGoal == "Maintain"
                ? _userWeight > 0 &&
                        _userHeight > 0 &&
                        _selectedGoal != "Select Your Goal" &&
                        _selectedItem != "Select Your Activity Level"
                    ? Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        child: Lottie.asset("assets/ticks.json", repeat: false),
                      )
                    : const SizedBox()
                : _userGoalPeriod > 0 &&
                        _userWeightAmount > 0 &&
                        _userWeight > 0 &&
                        _userHeight > 0 &&
                        _selectedGoal != "Select Your Goal" &&
                        _selectedItem != "Select Your Activity Level"
                    ? Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        child: Lottie.asset("assets/ticks.json", repeat: false),
                      )
                    : const SizedBox(),
            SizedBox(
              height: 1.h,
            ),
            _selectedGoal == "Maintain"
                ? _userWeight > 0 &&
                        _userHeight > 0 &&
                        _selectedGoal != "Select Your Goal" &&
                        _selectedItem != "Select Your Activity Level"
                    ? Container(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          "Continue",
                          Colors.deepPurple,
                          () async {
                            uploadUserData.userHeight = _userHeight.toString();
                            uploadUserData.userWeight = _userWeight.toString();
                            uploadUserData.activityLevel = _selectedItem!;
                            uploadUserData.userGoal = _selectedGoal!;
                            await uploadUserData.uploadUserData();
                            Navigator.of(context).pushReplacementNamed(EmailVerification.routeName);
                          },
                          15.w,
                          Colors.white,
                          4.w,
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          "Survey Not Completed",
                          Colors.deepPurple.withOpacity(0.3),
                          () {
                            null;
                          },
                          15.w,
                          Colors.black,
                          4.w,
                        ),
                      )
                : _userGoalPeriod > 0 &&
                        _userWeightAmount > 0 &&
                        _userWeight > 0 &&
                        _userHeight > 0 &&
                        _selectedGoal != "Select Your Goal" &&
                        _selectedItem != "Select Your Activity Level"
                    ? Container(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          "Continue",
                          Colors.deepPurple,
                          () async {
                            uploadUserData.userHeight = _userHeight.toString();
                            uploadUserData.userWeight = _userWeight.toString();
                            uploadUserData.activityLevel = _selectedItem!;
                            uploadUserData.userGoal = _selectedGoal!;
                            uploadUserData.goalAmount = _userWeightAmount.toString();
                            uploadUserData.timePeriod = _userGoalPeriod.toString();
                            await uploadUserData.uploadUserData();
                            Navigator.of(context).pushReplacementNamed(EmailVerification.routeName);
                          },
                          15.w,
                          Colors.white,
                          4.w,
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          "Survey Not Completed",
                          Colors.deepPurple.withOpacity(0.3),
                          () {
                            null;
                          },
                          15.w,
                          Colors.black,
                          4.w,
                        ),
                      ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Shape Shifter Fitness (SriLanka) Limited.",
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
            SizedBox(
              height: 4.h,
            )
          ],
        ),
      ),
    );
  }
}
