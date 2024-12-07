import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductUseCase extends UseCase<List<ProductEntity>, getAllProductParams> {
  final ProductRepository productRepository;

  GetAllProductUseCase(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call (getAllProductParams params) async {
    return await productRepository.getAllProducts();
  }
}
class getAllProductParams extends Equatable {
  final String query;

  const getAllProductParams({required this.query});

  @override
  List<Object> get props => [query];
}