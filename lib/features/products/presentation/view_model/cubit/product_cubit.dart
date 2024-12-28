import 'package:elevate_flutter_task/features/products/domain/use_cases/products.dart';
import 'package:elevate_flutter_task/features/products/presentation/view_model/cubit/product_stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductCubit extends Cubit<ProductStats> {
  ProductCubit(this._products) : super(ProductInitial());
  final Products _products;
  static ProductCubit get(context) => BlocProvider.of(context);

  Future<void> getProducts() async {
    emit(ProductLoading());
    final response = await _products();
    response.fold(
      (error) => emit(ProductError(message: error.message)),
      (product) => emit(ProductSuccess(products: product)),
    );
  }
}
