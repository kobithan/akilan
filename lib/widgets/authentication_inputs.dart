import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../providers/user_form_control.dart';


class FormFields extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final TextEditingController textEditingController;
  final bool show;
  final TextInputAction action;
  final Function submit;
  final TextInputType type;
  final bool isPassword;
  final bool isError;
  final FocusNode focusNode;
  final Function moveFocus;

  const FormFields(
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.textEditingController,
    this.show,
    this.action,
    this.submit,
    this.type,
    this.isPassword,
    this.isError, this.focusNode, this.moveFocus,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _visibility = Provider.of<UserFormControl>(context).visibility;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor,
        border: isError ? Border.all(color: Colors.red) : null,
      ),
      width: 80.w,
      padding: EdgeInsets.symmetric(
        vertical: 0.8.h,
        horizontal: 5.w,
      ),
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      child: TextFormField(
        obscureText: isPassword ? _visibility : show? true : false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: color,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _visibility
                        ? Icons.visibility
                        : Icons.visibility_off_rounded,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    Provider.of<UserFormControl>(context, listen: false).toggle();
                  },
                )
              : null,
        ),
        textInputAction: action,
        keyboardType: type,
        onChanged: submit(),
      ),
    );
  }
}
