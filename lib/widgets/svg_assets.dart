import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final double width;
  final double height;

  const SvgImage(
    this.width,
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(2.h),
      alignment: Alignment.center,
      child: SvgPicture.asset("assets/undraw_working_out_-6-psf.svg", width: width,),
    );
  }
}
