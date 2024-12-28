import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_flutter_task/core/resources/assets_manager.dart';
import 'package:elevate_flutter_task/core/resources/color_manager.dart';
import 'package:elevate_flutter_task/core/resources/styles_manager.dart';
import 'package:elevate_flutter_task/core/resources/values_manager.dart';
import 'package:elevate_flutter_task/core/widgets/heart_button.dart';
import 'package:elevate_flutter_task/features/products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {},
      child: Container(
        width: 191.w,
        height: 237.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignCenter,
            // ignore: deprecated_member_use
            color: ColorManager.primary.withOpacity(0.3),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: CachedNetworkImage(
                      height: 128.h,
                      imageUrl: product.image ?? '',
                      width: screenSize.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  PositionedDirectional(
                    top: screenSize.height * 0.01,
                    end: screenSize.width * 0.02,
                    child: HeartButton(onTap: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(Insets.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      style: getMediumStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenSize.height * 0.002),
                    Text(
                      product.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                        color: ColorManager.text,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    SizedBox(
                      width: screenSize.width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP ${product.priceAfterDiscount ?? product.price}',
                            style: getRegularStyle(
                              color: ColorManager.text,
                              fontSize: 14.sp,
                            ),
                          ),
                          Visibility(
                            visible: product.priceAfterDiscount != null,
                            child: Text(
                              '${product.price}',
                              style: getTextWithLine(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review (${product.rate ?? ''})',
                                style: getRegularStyle(
                                  color: ColorManager.text,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRate,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            ImageAssets.addCart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
