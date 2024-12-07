import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/homestore_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeStoreModel>> getHomestore();
 }

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeStoreModel>> getHomestore() => _getHomeFromUrl(homeUrl);


  Future<List<HomeStoreModel>> _getHomeFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );


    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      List<HomeStoreModel> list = jsonList.map((json)=> HomeStoreModel.fromJson(json)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}