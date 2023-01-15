import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cal_meter.dart';


class ShowBurntCalories extends StatefulWidget {
  const ShowBurntCalories({Key? key}) : super(key: key);

  @override
  _ShowBurntCaloriesState createState() => _ShowBurntCaloriesState();
}

class _ShowBurntCaloriesState extends State<ShowBurntCalories> {
  //var progBar = IngredientProgress(ingredient: "calories burnt", leftAmount: 500, progress: 3000, progressColor: Colors.indigoAccent.shade100, width: 0.1);
  @override
  Widget build(BuildContext){
    return Padding(
      padding: const EdgeInsets.only(top:5.0,left: 20, right: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "You've burned",
                  style: TextStyle(
                    color: Colors.blue.shade800,
                      fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox (
              height: 20,
            ),
            Container(
              height: 100,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  //border: Border.all(color: Colors.blue.shade800,width: 4),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
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
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CalorieProgBar(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
