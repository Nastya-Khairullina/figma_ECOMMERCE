import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/homestore_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remore_data.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(

  {required this.homeRemoteDataSource});


  @override
  Future<Either<Failure, List<HomeStoreEntity>>> getHomestore() async{
  try{
  final remoteHomestore = await homeRemoteDataSource.getHomestore();
  return Right (remoteHomestore);
  } on ServerException {
  return Left(ServerFailure());
  }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.

  noSuchMethod

  (

  invocation

  );
}