import 'package:dio/dio.dart';

import '../../../../core/remote/models/api_response.dart';
import '../models/summary_model.dart';

class SummaryRemoteDatasource {
  final Dio dio;

  SummaryRemoteDatasource({required this.dio});

  Future<ApiResponse<SummaryModel>> getSummaries() async {
    //Simulate Fake Login
    Map<String, dynamic> responseMap = {};
    Future.delayed(const Duration(seconds: 3), () {
      responseMap = {
        'success': true,
        'data': <SummaryModel>[
          SummaryModel(jenis: SummaryJenis.jenis_off.name, total: 0),
          SummaryModel(jenis: SummaryJenis.jenis_on.name, total: 0),
          SummaryModel(jenis: SummaryJenis.tte_off.name, total: 7),
          SummaryModel(jenis: SummaryJenis.tte_on.name, total: 13),
          SummaryModel(jenis: SummaryJenis.disposisi_off.name, total: 6),
          SummaryModel(jenis: SummaryJenis.disposisi_on.name, total: 34),
        ],
      };
    });
    return ApiResponse.fromMap(
      responseMap,
      (data) => SummaryModel.fromMap(data),
    );
  }
}
