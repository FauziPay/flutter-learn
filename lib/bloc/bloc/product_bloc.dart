import 'package:bloc/bloc.dart';
import 'package:flutter_learn_parse/data/products_data_dummy.dart';
import 'package:meta/meta.dart';
import 'package:flutter_learn_parse/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<OnProductEventCalled>((event, emit) async {
      emit(
        ProductLoading(),
      );
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(
        ProductLoaded(productsDataDummy),
      );
    });
  }
}
