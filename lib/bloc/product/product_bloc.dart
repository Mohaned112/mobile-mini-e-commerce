import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_finalproject/model/models.dart';
import 'package:ecommerce_finalproject/repositories/product/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductCubit({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    _mapLoadProductsToState();
  }

  void _mapLoadProductsToState() {
    emit(ProductLoading());
    _productRepository.getAllProducts().listen(
          (products) => emit(ProductLoaded(products: products)),
    );
  }

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}