import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/screens/home_screen.dart';
import 'package:shape_shifter_fitness_application/screens/navigation_screen.dart';

 //CALLING WIDGET FILE WITH IT'S PATH

class DemoMainScreen extends StatefulWidget {

  //This is the route name for your pages, for every new page you create create a static const variable with same name and change value to your newly created page ue the same format first add "/" then add your screen name no spaces.
  static const routeName = "/demoMainScreen";

  const DemoMainScreen({Key? key}) : super(key: key);

  @override
  State<DemoMainScreen> createState() => _DemoMainScreenState();
}

class _DemoMainScreenState extends State<DemoMainScreen> {

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await Provider.of<CalorieProgress>(context, listen: false).startApplication(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final calorieData = Provider.of<CalorieProgress>(context);
    return Scaffold(
      body: calorieData.isLogged ? const Center(child: CupertinoActivityIndicator(radius: 15,)) : const NavScreen(),// THIS IS HOW YOU CALL A WIDGET FROM WIDGETS FOLDER
    );
  }
}
