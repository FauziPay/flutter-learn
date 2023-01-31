import 'package:bloc/bloc.dart';
import 'package:flutter_learn_parse/data/products_data_dummy.dart';
import 'package:flutter_learn_parse/model/product.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts() async {
    emit(ProductLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ProductLoaded(productsDataDummy));
  }
}
