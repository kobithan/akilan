import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/body_type_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectBodyType extends StatelessWidget {
  const SelectBodyType({Key? key}) : super(key: key);

  Widget buildImage(String image, int index, List type, BuildContext context) =>
      Stack(
        children: [
          Hero(
            tag: '${type[index]} $image',
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.5.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BodyTypeDetailScreen.routeName,
                    arguments: {
                      'imagePath': image,
                      'title': type[index],
                      'gender': index == 1 || index == 3 || index == 5
                          ? 'Female'
                          : 'Male'
                    },
                  );
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SvgPicture.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(2.h),
            child: Text(
              type[index],
              style: index == 1 || index == 3 || index == 5
                  ? TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  : TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          ),
          Padding(
            padding: index == 1 || index == 3 || index == 5
                ? EdgeInsets.only(
                    left: 4.h,
                    right: 4.h,
                    bottom: 7.h,
                  )
                : EdgeInsets.only(
                    left: 4.h,
                    right: 4.h,
                    bottom: 2.h,
                  ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: null,
                child: Icon(
                  Icons.touch_app_rounded,
                  color: index == 1 || index == 3 || index == 5
                      ? Colors.white
                      : Colors.black,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/mesomorph_Male.svg',
      'assets/mesomorph_Female.svg',
      'assets/ectomorph_Male.svg',
      'assets/ectomorph_Female.svg',
      'assets/endomorph_Male.svg',
      'assets/endomorph_Female.svg',
    ];
    final humanType = [
      'Mesomorph Male',
      'Mesomorph Female',
      'Ectomorph Male',
      'Ectomorph Female',
      'Endomorph Male',
      'Endomorph Female',
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(1.h),
          child: const Align(
            alignment: Alignment.topCenter,
            child: FloatingActionButton(
              onPressed: null,
              child: Icon(
                Icons.touch_app_rounded,
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            height: 70.h,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          itemBuilder: (context, index, imageItem) {
            final selectedImage = images[index];
            return buildImage(selectedImage, index, humanType, context);
          },
        )
      ],
    );
  }
}
