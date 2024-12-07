import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/homestore_entity.dart';
import '../repositories/home_repository.dart';

class GetAllHomestoreUseCase extends UseCase<List<HomeStoreEntity>, getAllHomestoreParams> {
  final HomeRepository homestoreRepository;

  GetAllHomestoreUseCase(this.homestoreRepository);

  @override
  Future<Either<Failure, List<HomeStoreEntity>>> call(getAllHomestoreParams params) async {
    return await homestoreRepository.getHomestore()!;
  }
}
class getAllHomestoreParams extends Equatable {
  final String query;

  const getAllHomestoreParams({required this.query});

   @override
  List<Object> get props => [query];
}