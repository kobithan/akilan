import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAccess with ChangeNotifier {

  String _modelDownloadLink = "";

  var _isLoading = false;

  get isLoading => _isLoading;

  String get modelDownloadLink => _modelDownloadLink;

  Future<void> loadRequestedModel(String path) async {
    _isLoading = true;
    notifyListeners();

    final ref = FirebaseStorage.instance.ref(path);

    final link = await ref.getDownloadURL();

    _modelDownloadLink = link;

    _isLoading = false;

    notifyListeners();
  }

  Future<void> uploadRequestedModel() async {
    await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image
    );
  }
}
