import 'package:Kourouna/models/general_data_model.dart';
import 'package:Kourouna/models/other_case_model.dart';
import 'package:Kourouna/repositories/api_client.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({@required this.apiClient}) : assert(apiClient != null);
  Future<GeneralDataModel> getAllCountryData() async {
    return apiClient.getAllCountryData();
  }

  Future<OtherCaseModel> getRecoveredCases() async {
    return apiClient.getRecoveredCases();
  }

  Future<OtherCaseModel> getConfirmedCases() async {
    return apiClient.getConfirmedCases();
  }

  Future<OtherCaseModel> getDeathCases() async {
    return apiClient.getDeathCases();
  }
}
