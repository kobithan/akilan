import 'package:flutter/material.dart';

import '../widgets/content_3d_model.dart';

class View3DModelScreen extends StatelessWidget {
  static const routeName = "/3DModelScreen";

  const View3DModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Model3D(),
    );
  }
}
