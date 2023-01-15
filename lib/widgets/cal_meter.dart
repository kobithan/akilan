import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calorie_progress.dart';

class CalorieProgBar extends StatelessWidget {

  const CalorieProgBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double wid = 1;
    final calorieData = Provider.of<CalorieProgress>(context);
    //final calFunction = Provider.of<CalorieProgBar>(context,listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${calorieData.progress.toString().toUpperCase()} Calories",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 10,
                  width: wid,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 15,
                  width: wid * calorieData.progress,
                  decoration: const BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text("${calorieData.leftAmount} Left",
            style: const TextStyle(
              fontSize: 16,
            ),),
          ],
        ),
        /*ElevatedButton(onPressed:(){
          calorieData.functionName();
        } , child: Text)*/
      ],
    );
  }
}




