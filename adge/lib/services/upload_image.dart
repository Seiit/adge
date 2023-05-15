import 'dart:io';

import 'package:adge/api/AdgeApi.dart';
import 'package:adge/models/usuario.dart';
import 'package:adge/services/navigation_service.dart';
import 'package:adge/services/select_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadUserImages(String path, Usuario user, context) async {
  uploadImage(
    (file) async {
      String fileName = user.uid + ".jpg";

      Reference ref = storage.ref().child('avatars/' + fileName);
      UploadTask uploadTask = ref.putBlob(file);

      await uploadTask.then((res) async {
        final String url = await res.ref.getDownloadURL();

        user.img = url;

        Map<String, dynamic> data = user.toMap();

        await AdgeApi.Put(path, data, context).then((json) async {
          if (json != null) {
            NavigationService.replaceTo('/dashboard/users/${user.uid}');
          }
        });
      }).catchError((error) {
        print('Error al subir la imagen: $error');
      });
    },
  );
  return false;
}
