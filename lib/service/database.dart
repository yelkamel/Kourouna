import 'dart:async';

import 'package:Kourouna/models/video_model.dart';
import 'package:Kourouna/service/api_path.dart';
import 'package:Kourouna/service/firestore_service.dart';
import 'package:uuid/uuid.dart';

abstract class Database {
  Stream<List<Video>> videoStream();
}

String documentUniqueId() {
  String id = Uuid().v1();
  return id;
}

class FirestoreDatabase implements Database {
  FirestoreDatabase();

  final _service = FirestoreService.instance;

  @override
  Stream<List<Video>> videoStream() => _service.collectionStream(
        path: APIPath.videos(),
        builder: (data, uid) => Video.fromMap(data, uid),
      );
}
