import 'package:dartz/dartz.dart';

import '../../data/datasources/summary_remote_data_source.dart';
import '../../data/models/summary_model.dart';

class SummaryRepository {
  final SummaryRemoteDatasource summaryRemoteDatasource;

  SummaryRepository({
    required this.summaryRemoteDatasource,
  });

  Future<Either<String, List<SummaryModel>>> getSummaries() async {
    final response = await summaryRemoteDatasource.getSummaries();

    if (response.isError) {
      return Left(response.errorMessage);
    }
    return Right(response.getDataList);
  }
}
