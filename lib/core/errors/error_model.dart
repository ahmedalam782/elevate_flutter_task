import 'package:elevate_flutter_task/core/network/remote/end_point.dart';

class ErrorModel {
  String? message;

  ErrorModel({this.message});

  factory ErrorModel.fromMap(Map<String, dynamic> data) => ErrorModel(
        message: data[ApiKey.message] as String?,
      );
}
