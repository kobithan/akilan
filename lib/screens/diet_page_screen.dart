// ignore: duplicate_ignore
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/screens/diet_plan_screen.dart';

import 'package:shape_shifter_fitness_application/screens/food_search_page.dart';
import 'package:shape_shifter_fitness_application/screens/home_screen.dart';
import 'package:shape_shifter_fitness_application/screens/navigation_screen.dart';
import 'package:shape_shifter_fitness_application/screens/profile_screen.dart';
import 'package:shape_shifter_fitness_application/widgets/contact_dietician_widget.dart';
import 'package:shape_shifter_fitness_application/widgets/contact_instructor_widget.dart';
import 'package:vector_math/vector_math_64.dart' as math;


import '../providers/read_user_data.dart';
import '../widgets/greet_user_widget.dart';


class DietPage extends StatefulWidget {
  const DietPage({Key? key}) : super(key: key);

  static const routeName = "/DietScreen";

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  get prefixIcon => null;



  @override
  Widget build(BuildContext context) {

    final calMeter = Provider.of<CalorieProgress>(context, listen: false);
    final dietPlans =
        Provider.of<ReadUserData>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(NavScreen.routeName);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 27,
                       color: Colors.black,
                    ),
                    label: Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 213),
                    child: IconButton(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              const GreetUser(),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: 800,
                height: 160,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(70.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 156, 156, 156),
                      blurRadius: 4.0,
                      spreadRadius: 5.0,
                      offset:
                      Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: _RadialProgress(
                        width: 110,
                        height: 100,
                        progress: 0.2,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _IngredientProgress(
                          ingredient: "Protein",
                          progress: calMeter.tookProtein/calMeter.protein.toDouble(),
                          progressColor: Colors.green,
                          leftAmount: calMeter.protein.toInt() - calMeter.tookProtein.toInt(),
                          width: 110,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _IngredientProgress(
                          ingredient: "Carbs",
                          progress: calMeter.tookCarbs/calMeter.carbs.toDouble(),
                          progressColor: Colors.red,
                          leftAmount: calMeter.carbs.toInt() - calMeter.tookCarbs.toInt(),
                          width: 110,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _IngredientProgress(
                          ingredient: "Fat",
                          progress: calMeter.tookFat/calMeter.fat.toDouble(),
                          progressColor: Colors.yellow,
                          leftAmount: calMeter.fat.toInt() - calMeter.tookFat.toInt(),
                          width: 110,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Meals Today',
                      style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 35,
                    ), onPressed: ()  {
                      showSearch(context: context, delegate: FoodSearchPage());
                  },
                  ),

                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
               child:InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.of(context).pushNamed(DietPlanScreen.routeName, arguments: {
                      'dietDetails' : dietPlans.dynamicDataList,
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 10, top: 5),
                              child: Text("Breakfast",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 205),
                              child: Icon(Icons.add_circle_outline_rounded,
                                size: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.of(context).pushNamed(DietPlanScreen.routeName, arguments: {
                      'dietDetails' : dietPlans.dynamicDataList1,
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Text("Lunch",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 225),
                              child:  Icon(Icons.add_circle_outline_rounded,
                              size: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                width: 380,
                height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                child:InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.of(context).pushNamed(DietPlanScreen.routeName, arguments: {
                      'dietDetails' : dietPlans.dynamicDataList2,
                    });
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Text("Dinner",
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 220),
                              child: Icon(Icons.add_circle_outline_rounded,
                                size: 35.0,
                              ),
                            ),
                         ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ContactDieticianOptions(),
        ]),
          ),

        ));
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key? key,
        required this.ingredient,
        required this.leftAmount,
        required this.progress,
        required this.progressColor,
        required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress(
      {Key? key,
        required this.height,
        required this.width,
        required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final calMeter = Provider.of<CalorieProgress>(context, listen: false);
    final leftAmount = calMeter.dietCalLeftAmount.toInt()-(calMeter.tookFat.toInt()+calMeter.tookCarbs.toInt()+calMeter.tookProtein.toInt()).toInt();

    return CustomPaint(
      painter: _RadialPainter(
        progress: 0.7,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: leftAmount.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF200087),
                  ),
                ),
                const TextSpan(text: "\n"),
                const TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = const Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
