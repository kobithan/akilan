import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';


import '../providers/upload_user_data.dart';
import '../screens/user_survey_screen.dart';

class BodyTypeDetailScreen extends StatelessWidget {
  static const routeName = "/BodyTypeDetailScreen";

  const BodyTypeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final imagePath = routeArguments['imagePath'];
    final title = routeArguments['title'];
    final gender = routeArguments['gender'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20.sp,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Hero(
            tag: '$title $imagePath',
            child: Container(
              padding: EdgeInsets.only(
                top: 4.h,
                left: 4.h,
                right: 4.h,
                bottom: 2.h,
              ),
              height: 65.h,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SvgPicture.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.h),
            child: Text(
              'Are You Confident That This Is The Closest Look To Your Body ?',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  heroTag: 'correct',
                  backgroundColor: Colors.green,
                  onPressed: () {
                    final uploadUserData = Provider.of<UploadUserData>(context, listen: false);
                    uploadUserData.gender = gender;
                    uploadUserData.userModelName = title;
                    Navigator.of(context).pushReplacementNamed(UserSurveyScreen.routeName);
                  },
                  child: const Icon(Icons.done),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  heroTag: 'wrong',
                  backgroundColor: Theme.of(context).errorColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.clear),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
