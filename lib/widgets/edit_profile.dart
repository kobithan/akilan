import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shape_shifter_fitness_application/providers/firebase_storage_service.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../providers/read_user_data.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateUserInfo = Provider.of<FirebaseStorageAccess>(context, listen: false);
    final userInformation = Provider.of<ReadUserData>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(1.5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30.h,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 1.h, bottom: 1.h),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: const FaIcon(FontAwesomeIcons.camera, color: Colors.black,),
                      onPressed: () {
                        updateUserInfo.uploadRequestedModel();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "${userInformation.firstName} ${userInformation.lastName}",
            style: TextStyle(fontSize: 18.sp),
          ),
          Text(
            userInformation.email!,
            style: TextStyle(fontSize: 10.sp, color: Colors.black54),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID : ${userInformation.userID}',
                  style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  userInformation.shapeShifterUser!
                      ? 'Account : Shape-Shifter Fitness Account'
                      : 'Account - Google Account',
                  style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Divider(
            thickness: 0.5.sp,
            color: Colors.black38,
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Information",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Name : ${userInformation.firstName} ${userInformation.lastName}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Age : ${userInformation.age}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Mobile-Number : ${userInformation.mobileNumber}",
                  style: TextStyle(fontSize: 12.sp),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.zero,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit-Info",
                      style: TextStyle(fontSize: 10.sp, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
