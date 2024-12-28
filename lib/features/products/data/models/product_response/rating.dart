import 'package:elevate_flutter_task/core/network/remote/end_point.dart';

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json[ApiKey.rate] as num?)?.toDouble(),
        count: json[ApiKey.count] as int?,
      );
}
