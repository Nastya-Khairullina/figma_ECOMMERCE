import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/product_usecase.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase getAllProductUseCase;

  ProductBloc({required this.getAllProductUseCase}) : super(ProductLoadingState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      final _loadedproduct = await getAllProductUseCase(getAllProductParams(query: event.productQuery));
      List<ProductEntity> _loadedProductList = [];

      _loadedproduct.fold(
               (failure){
               emit(ProductErrorState(message: failure.toString()));
              },
              (loadedProductList){
            _loadedProductList.addAll(loadedProductList);
            emit(ProductLoadedState(loadedProduct: _loadedProductList));
          });

    });
  }
}