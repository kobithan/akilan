import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:sizer/sizer.dart';

import '../providers/firebase_storage_service.dart';

class Model3D extends StatelessWidget {
  const Model3D({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String downloadPath =
        Provider.of<FirebaseStorageAccess>(context).modelDownloadLink;
    return Stack(
      children: [
        Center(
          child: BabylonJSViewer(src: downloadPath),
        ),
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.clear),
              backgroundColor: Theme.of(context).errorColor,
            ),
          ),
        ),
      ],
    );
  }
}
