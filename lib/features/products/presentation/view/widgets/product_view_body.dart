import 'package:elevate_flutter_task/core/di/service_locator.dart';
import 'package:elevate_flutter_task/core/resources/values_manager.dart';
import 'package:elevate_flutter_task/core/widgets/error_indicator.dart';
import 'package:elevate_flutter_task/core/widgets/loading_indicator.dart';
import 'package:elevate_flutter_task/features/products/presentation/view/widgets/product_item.dart';
import 'package:elevate_flutter_task/features/products/presentation/view_model/cubit/product_cubit.dart';
import 'package:elevate_flutter_task/features/products/presentation/view_model/cubit/product_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<ProductCubit>()..getProducts(),
      child: BlocBuilder<ProductCubit, ProductStats>(
        builder: (_, state) {
          if (state is ProductLoading) {
            return const LoadingIndicator();
          } else if (state is ProductError) {
            return ErrorIndicator(message: state.message);
          } else if (state is ProductSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 7 / 9,
              ),
              itemBuilder: (_, index) =>
                  ProductItem(product: state.products[index]),
              itemCount: state.products.length,
              padding: EdgeInsets.all(Insets.s16.sp),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
