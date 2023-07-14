import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/models/app_state.dart';
import '../core/models/product.dart';
import '../services/product_service.dart';


class ProductBloc extends Bloc<AppEvent, AppState<Product>> {
  final ProductService service;
  ProductBloc([ProductService? productService])
      : service = productService ?? ProductService(),
        super(IdleAppState()) {
    on<FetchProductEvent>(fetchProduct);
  }

  Future fetchProduct(
    FetchProductEvent event,
    Emitter<AppState<Product>> emit,
  ) async {
    if (state is! SuccessListAppState<Product>) emit(LoadingAppState());
    try {
      List<Product> products = await service.getProducts();
      if (products.isEmpty) {
        emit(EmptyAppState());
        return;
      }
      emit(SuccessListAppState(products));
      return products;
    } catch (error) {
      emit(FailureAppState(error));
      return;
    }
  }
}
