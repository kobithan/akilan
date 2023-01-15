import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/diet_plan_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_service.dart';
import '../providers/calculate_3d_model.dart';
import '../providers/firebase_storage_service.dart';
import '../screens/navigation_screen.dart';
import '../screens/veiw_3d_model_screen.dart';
import '../providers/read_user_data.dart';
import '../screens/profile_screen.dart';
import '../screens/user_survey_screen.dart'; // THIS IS HOW YOU IMPORT ANOTHER SCREEN

class DemoWidget extends StatelessWidget {
  const DemoWidget({Key? key}) : super(key: key);

  //FUNCTION TO USE NAMED ARGUMENTS
  Future<void> goToNewPage(BuildContext ctx) async {
    await Provider.of<Calculate3DModel>(ctx, listen: false)
        .calculate3DBodyType(ctx);
    Navigator.of(ctx).pushNamed(View3DModelScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final _isLoading = Provider.of<FirebaseStorageAccess>(context).isLoading;
    final _isLoadingProfile = Provider.of<ReadUserData>(context).isLoading;
    return _isLoading || _isLoadingProfile
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(
                  radius: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(2.h),
                ),
                Text(
                  _isLoading ? "Accessing Your Real Time 3D Model" : "",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Container(
                padding: EdgeInsets.all(2.h),
                //THIS IS HOW YOU ADD PADDING USING SIZER
                child: const Text(
                  "This is the demo screen DO NOT CHANGE THIS, DO NOT MODIFY THIS, CREATE A NEW SCREEN IN SCREENS FOLDER AND DO CHANGES THERE !!!",
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                child: const Text("Show 3D Model"),
                onPressed: () =>
                    goToNewPage(context), //THIS IS HOW YOU CALL A FUNCTION
              ),
              ElevatedButton(
                  child: const Text("User Profile"),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(UserProfileScreen.namedRoute);
                  } //THIS IS HOW YOU CALL A FUNCTION
                  ),
              ElevatedButton(
                child: const Text("logout"),
                onPressed: () {
                  context.read<AuthenticationService>().signOut(context);
                }, //THIS IS HOW YOU CALL A FUNCTION
              ),
              ElevatedButton(
                child: const Text("BodyType"),
                onPressed: () {
                  Navigator.of(context).pushNamed(UserSurveyScreen.routeName);
                }, //THIS IS HOW YOU CALL A FUNCTION
              ),
              ElevatedButton(
                  child: const Text("Home Page"),
                  onPressed: () async {
                    await Provider.of<Calculate3DModel>(context, listen: false)
                        .calculate3DBodyType(context);
                    Navigator.of(context).pushNamed(NavScreen.routeName);
                  } //THIS IS HOW YOU CALL A FUNCTION
                  ),
              ElevatedButton(
                child: const Text("Diet"),
                onPressed: () {
                  Navigator.of(context).pushNamed(DietPlanScreen.routeName);
                }, //THIS IS HOW YOU CALL A FUNCTION
              ),
            ],
          );
  }
}
