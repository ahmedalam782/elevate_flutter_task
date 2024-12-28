import 'package:elevate_flutter_task/core/widgets/custom_app_bar.dart';
import 'package:elevate_flutter_task/features/products/presentation/view/widgets/product_view_body.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: buildAppBar(
          title: "Products",
          context,
        ),
        body: const ProductViewBody(),
      ),
    );
  }
}
