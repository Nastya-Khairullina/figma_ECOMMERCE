import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/homestore_entity.dart';

abstract class HomeRepository {

  Future<Either<Failure, List<HomeStoreEntity>>>? getHomestore();

}