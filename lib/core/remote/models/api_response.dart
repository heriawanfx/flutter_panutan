import 'pagination_meta.dart';

class ApiResponse<T> {
  final int? code;
  final bool? success;
  final String? error;
  final dynamic data;
  final PaginationMeta? meta;

  ApiResponse._({
    required this.code,
    required this.success,
    required this.error,
    required this.data,
    required this.meta,
  });

  int get getCode => code ?? 200;
  bool get isSuccess => success == true;
  bool get isError => error?.isNotEmpty == true;
  String get errorMessage => error ?? 'Error Occured';
  List<T> get getDataList {
    return List<T>.from((data ?? []) as List);
  }

  T get getData {
    return data as T;
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'success': success,
      'error': error,
      'data': data,
      'meta': meta,
    };
  }

  factory ApiResponse.fromMap(
    Map<String, dynamic> map,
    Function(Map<String, dynamic> data) modelMapper,
  ) {
    return ApiResponse._(
      code: map['code'] as int?,
      success: map['success'] as bool?,
      error: map['error'] as String?,
      data: map['data'] != null
          ? map['data'] is List<dynamic>
              ? List.from(
                  (map["data"] as List).map(
                    (data) => modelMapper(data as Map<String, dynamic>),
                  ),
                )
              : modelMapper(map["data"] as Map<String, dynamic>) as T?
          : null,
      meta: map['meta'] != null
          ? PaginationMeta.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
    );
  }
}
