import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/providers/authentication_service.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../screens/profile_edit_screen.dart';
import '../providers/read_user_data.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final userInformation = Provider.of<ReadUserData>(context, listen: false);
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(1.h),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.of(context).pushNamed(ProfileEditScreen.routeName);
            },
            child: Card(
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${userInformation.firstName} ${userInformation.lastName}",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Text(
                          userInformation.shapeShifterUser!
                              ? "Shape-Shifter Fitness Account"
                              : "Google Account User",
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black54),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&usqp=CAU'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 70.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
              onPressed: () {
                setState(() {
                  context.read<AuthenticationService>().signOut(context);
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 1.5.h,
                  left: 1.5.h,
                  top: 1.8.h,
                  bottom: 1.8.h,
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
