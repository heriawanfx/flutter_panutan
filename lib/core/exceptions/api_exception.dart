// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

@Deprecated('Consider refactor response to use ApiResponse<T>')
class ApiException implements Exception {
  final String error;

  ApiException(this.error);

  bool get isError => error.isNotEmpty == true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
    };
  }

  factory ApiException.fromMap(Map<String, dynamic> map) {
    return ApiException(
      map['error'] != null ? map['error'] as String : '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ApiException.fromJson(String source) =>
      ApiException.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
