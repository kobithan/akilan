import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/firebase_storage_service.dart';
import '../providers/read_user_data.dart';

class Calculate3DModel with ChangeNotifier {

  late String _importedBodyType;

  late String _modelName;

  String get modelName => _modelName;

  Future<void> calculate3DBodyType(BuildContext context) async {

    _importedBodyType = Provider.of<ReadUserData>(context, listen: false).modelName!;

    if (_importedBodyType == 'Mesomorph Male') {
      _modelName = "Mesomorph Male.glb";
    } else if (_importedBodyType == 'Mesomorph Female') {
      _modelName = "Mesomorph Female.glb";
    } else if (_importedBodyType == 'Ectomorph Male') {
      _modelName = "Ectomorph Male.glb";
    } else if (_importedBodyType == 'Ectomorph Female') {
      _modelName = "Ectomorph Female.glb";
    } else if (_importedBodyType == 'Endomorph Male') {
      _modelName = "Endomorph Male.glb";
    } else if (_importedBodyType == 'Endomorph Female') {
      _modelName = "Endomorph Female.glb";
    } else {
      _modelName = "Astronaut3d.glb";
    }

    await Provider.of<FirebaseStorageAccess>(context, listen: false)
        .loadRequestedModel('3D_Models/$_modelName');

    notifyListeners();
  }
}
