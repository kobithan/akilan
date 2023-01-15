import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/diet_meal_detail_screen.dart';

class DietPlans extends StatelessWidget {
  final String title;
  final String image;
  final String amount;
  final String calories;
  final int index;

  const DietPlans(
      this.title, this.image, this.amount, this.calories, this.index,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          DietMealDetailScreen.routeName,
          arguments: {
            'index': index,
          },
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 1.h,
                  right: 1.h,
                ),
                height: 4.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fastfood_rounded),
                        Text(
                          title,
                          style: TextStyle(fontSize: 11.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.scale_rounded),
                        Text(
                          amount,
                          style: TextStyle(fontSize: 11.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department),
                        Text(
                          calories,
                          style: TextStyle(fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
