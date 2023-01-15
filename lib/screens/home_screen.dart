import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/screens/profile_screen.dart';


import '../providers/firebase_storage_service.dart';
import '../providers/read_user_data.dart';
import '../screens/veiw_3d_model_screen.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);
  static const routeName = "/HomeScreenPage";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    final calorieData = Provider.of<CalorieProgress>(context);
    final String downloadPath =
        Provider.of<FirebaseStorageAccess>(context).modelDownloadLink;
    final user = Provider.of<ReadUserData>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 60, left: 30, right: 20),
                child: Column(
                  children: [
                    Row(children: [
                      Text(
                        'Hi ${user.firstName}',
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        icon: const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 45,
                        ),
                        onPressed: () async {
                          await Provider.of<ReadUserData>(context,listen: false).readUser();
                          Navigator.of(context).pushNamed(UserProfileScreen.namedRoute);
                        },
                      ),
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: 500,
                        height: 350,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed(View3DModelScreen.routeName);
                        },
                        child: Stack(
                          children: [ Center(
                            child: BabylonJSViewer(src: downloadPath),
                          ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.h, right: 1.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(
                                  heroTag: 'wrong',
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(View3DModelScreen.routeName);
                                  },
                                  child: const Icon(Icons.zoom_out_map_rounded),
                                  backgroundColor: Theme.of(context).errorColor,
                                ),
                              ),
                            ),
                      ],
                        ),
                      ),
                      ),
                    /*const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 500,
                        height: 200,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(80))),
                      ),*/
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      height: 90,
                      width: 800,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://www.kindpng.com/picc/m/25-252514_circle-icons-running-running-icon-flat-hd-png.png'),
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                    child: const Center(),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children:const  [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20, top: 20),
                                            child: Text("Run"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 50, right: 20, top: 20),
                                            child: Text("0/10 km"),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            LinearPercentIndicator(
                                              width: 230.0,
                                              lineHeight: 10.0,
                                              percent: 0,
                                              progressColor: const Color.fromARGB(
                                                  255, 217, 126, 69),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 90,
                      width: 800,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMbukahPdNg6_iTdndPx-0yr16ifja6PbqIIm3p2sMtP69nmNZTP7nHHXUDYrR1hiBoWA&usqp=CAU'),
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                    child: const Center(),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 20),
                                            child: Text("Calorie Burned (${calorieData.progress}/${user.workoutTotalCal})"),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            LinearPercentIndicator(
                                              width: 230.0,
                                              lineHeight: 10.0,
                                              percent: calorieData.progress.toInt()/user.workoutTotalCal!.toInt(),
                                              progressColor: const Color.fromARGB(
                                                  255, 236, 102, 75),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 90,
                      width: 800,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Ink.image(
                                    image: const NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz6XIhrGo3h18Zp2XA64C0XD9TR2DC_dTh5Tf1UX6UzPOs6O5OPjF3i8JpvxmDOvy35Wo&usqp=CAUg'),
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                    child: const Center(),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 20),
                                            child: Text("Calories Taken (${(calorieData.tookFat.toInt()+calorieData.tookCarbs.toInt()+calorieData.tookProtein.toInt()).toInt()}/${calorieData.dietCalLeftAmount.toInt()})"),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            LinearPercentIndicator(
                                              width: 230.0,
                                              lineHeight: 10.0,
                                              percent: (calorieData.tookFat.toInt()+calorieData.tookCarbs.toInt()+calorieData.tookProtein.toInt())/calorieData.dietCalLeftAmount.toInt(),
                                              progressColor: const Color.fromARGB(
                                                  255, 130, 199, 236),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
            //const BottomNavigation(),
          ],
        ),
      ),
    );
  }
}
