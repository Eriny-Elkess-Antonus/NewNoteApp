import 'package:json_annotation/json_annotation.dart';

class IndexedConverter<T> implements JsonConverter<List<T>, List<dynamic>> {
  const IndexedConverter(this.fromJsonConverter);

  final T Function(Map<String, dynamic> onMap) fromJsonConverter;

  @override
  List<T> fromJson(List<dynamic> jsonItems) {
    return jsonItems.asMap().entries.map((entry) {
      final index = entry.key;
      final json = entry.value;
      return fromJsonConverter({'index': index, ...json});
    }).toList();
  }

  @override
  List<dynamic> toJson(List<T> items) {
    throw UnimplementedError();
  }
}
