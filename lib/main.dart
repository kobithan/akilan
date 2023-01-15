import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/screens/Food_Details.dart';
import 'package:shape_shifter_fitness_application/screens/contact_dietician_screen.dart';
import 'package:shape_shifter_fitness_application/screens/contact_instructor_screen.dart';
import 'package:shape_shifter_fitness_application/screens/diet_meal_detail_screen.dart';
import 'package:shape_shifter_fitness_application/screens/diet_page_screen.dart';
import 'package:shape_shifter_fitness_application/screens/diet_plan_screen.dart';
import 'package:shape_shifter_fitness_application/screens/finished_workout_screen.dart';
import 'package:shape_shifter_fitness_application/screens/home_screen.dart';
import 'package:shape_shifter_fitness_application/screens/musicplayer_screen.dart';
import 'package:shape_shifter_fitness_application/screens/navigation_screen.dart';
import 'package:shape_shifter_fitness_application/screens/playlist_screen.dart';
import 'package:shape_shifter_fitness_application/screens/working_out_screen.dart';
import 'package:shape_shifter_fitness_application/screens/workout_home_screen.dart';
import 'package:shape_shifter_fitness_application/social_feed_page.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import '../screens/demo_main_screen.dart';
import '../screens/demo_new_screen.dart';
import '../screens/authentication_option_screen.dart';
import '../providers/authentication_service.dart';
import '../providers/authentication_process.dart';
import '../providers/authentication_validation.dart';
import '../providers/google_sign_in_service.dart';
import '../screens/verify_email_screen.dart';
import '../providers/email_verification_process.dart';
import '../providers/reset_password_service.dart';
import '../providers/user_form_control.dart';
import '../screens/reset_password_screen.dart';
import '../providers/calculate_3d_model.dart';
import '../providers/firebase_storage_service.dart';
import '../screens/veiw_3d_model_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/profile_edit_screen.dart';
import '../providers/read_user_data.dart';
import '../screens/select_body_type_screen.dart';
import '../screens/body_type_detail_screen.dart';
import '../providers/upload_user_data.dart';
import '../screens/user_survey_screen.dart';

//DO NOT CHANGE PUBSPEC.YAML FILE
//DO NOT CHANGE WIDGET_TEST.DART FILE
//ADD WIDGETS TO WIDGETS FOLDER
//CREATE NEW SCREENS ON SCREENS FOLDER
//CREATE DATA MODULES ON MODULE FOLDER
//DO NOT USE LOCAL IMAGES ALWAYS USE LINKS FOR IMAGES
//ALWAYS USE SIZER FUNCTION DO NOT USE DEFAULT VALUES
//DO NOT USE THEME/COLORS YET IT WILL BE DONE LATER

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShapeShifterApplication());
}

class ShapeShifterApplication extends StatelessWidget {
  const ShapeShifterApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance),
            ),
            StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges,
              initialData: null,
            ),
            ChangeNotifierProvider(
              create: (ctx) => AuthenticationProcess(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => AuthenticationValidation(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => GoogleSignInService(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => EmailVerificationProcess(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => UserFormControl(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => ResetPasswordService(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => FirebaseStorageAccess(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Calculate3DModel(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => ReadUserData(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => ReadUserData(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => UploadUserData(),
            ),
            ChangeNotifierProvider(create: (ctx) => CalorieProgress())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Shape Shifter Fitness",
            theme: ThemeData(),
            home: const AuthenticationChecker(),
            routes: {
              DemoMainScreen.routeName: (ctx) => const DemoMainScreen(),
              //MAIN HOME SCREEN SHOULD ALWAYS SHOULD BE ADDED TO HERE USING THIS FORMAT
              DemoNewScreen.routeName: (ctx) => const DemoNewScreen(),
              AuthenticationOptionScreen.routeName: (ctx) =>
                  const AuthenticationOptionScreen(),
              ResetPasswordScreen.routeName: (ctx) =>
                  const ResetPasswordScreen(),
              View3DModelScreen.routeName: (ctx) => const View3DModelScreen(),
              UserProfileScreen.namedRoute: (ctx) => const UserProfileScreen(),
              ProfileEditScreen.routeName: (ctx) => const ProfileEditScreen(),
              SelectBodyTypeScreen.routeName: (ctx) =>
                  const SelectBodyTypeScreen(),
              BodyTypeDetailScreen.routeName: (ctx) =>
                  const BodyTypeDetailScreen(),
              EmailVerification.routeName: (ctx) => const EmailVerification(),
              UserSurveyScreen.routeName: (ctx) => const UserSurveyScreen(),
              PlaylistScreen.routeName: (ctx) => const PlaylistScreen(), //THIS IS HOW YOU SET ROUTES FOR OTHER SCREENS
              //MusicPlayer.routeName: (ctx) => const MusicPlayer() ,
              MusicPlayerScreen.routeName:(ctx)=> const MusicPlayerScreen(),
              WorkoutHomeScreen.routeName: (ctx) => const WorkoutHomeScreen(),
              ContactInstructorScreen.routeName: (ctx) => const ContactInstructorScreen(),
              NavScreen.routeName: (ctx) => const NavScreen(),
              WorkingOutScreen.routeName: (ctx) => WorkingOutScreen(),
              FinishedWorkoutScreen.routeName: (ctx) => const FinishedWorkoutScreen(),
              HomeScreenPage.routeName: (ctx) => const HomeScreenPage(),
              DietPage.routeName: (ctx) => const DietPage(),
              SocialPage.routeName: (ctx) => const SocialPage(),
              FoodDetails.routeName: (ctx) => const FoodDetails(),
              DietPlanScreen.routeName: (ctx) => const DietPlanScreen(),
              ContactDieticianScreen.routeName: (ctx) => const ContactDieticianScreen(),
              DietMealDetailScreen.routeName: (ctx) => const DietMealDetailScreen(),


              //THIS IS HOW YOU SET ROUTES FOR OTHER SCREENS
            },
          ),
        );
      },
    );
  }
}

class AuthenticationChecker extends StatelessWidget {
  const AuthenticationChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    // ignore: unnecessary_null_comparison
    if (user != null) {
      return const SelectBodyTypeScreen();
    }
    return const AuthenticationOptionScreen();
  }
}
