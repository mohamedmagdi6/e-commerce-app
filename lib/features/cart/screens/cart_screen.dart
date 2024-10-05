import 'package:e_commerce_app/features/cart/screens/cart_screen_cubit/cart_screen_states.dart';
import 'package:e_commerce_app/features/cart/screens/cart_screen_cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartScreenStates>(
      bloc: CartScreenViewModel.get(context)..getCartProducts(),
      builder: (context, state) {
        return state is CartScreenSuccessState ||
                state is DeleteCartItemSuccessState
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Cart',
                    style: getMediumStyle(
                        fontSize: 20, color: ColorManager.textColor),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(
                          IconsAssets.icSearch,
                        ),
                        color: ColorManager.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icCart),
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            imagePath: CartScreenViewModel.get(context)
                                .products[index]
                                .productItemEntity!
                                .imageCover!,
                            title: CartScreenViewModel.get(context)
                                .products[index]
                                .productItemEntity!
                                .title!,
                            price: CartScreenViewModel.get(context)
                                .products[index]
                                .price!,
                            quantity: CartScreenViewModel.get(context)
                                .products[index]
                                .count!,
                            onDeleteTap: () {
                              CartScreenViewModel.get(context).deleteCartItem(
                                  CartScreenViewModel.get(context)
                                      .products[index]
                                      .productItemEntity!
                                      .id!);
                              CartScreenViewModel.get(context)
                                  .getCartProducts();
                            },
                            onDecrementTap: (value) {},
                            onIncrementTap: (value) {},
                            size: 40,
                            color: Colors.black,
                            colorName: 'Black',
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount:
                              CartScreenViewModel.get(context).products.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBotton(
                        totalPrice: 12212,
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              )
            : Skeletonizer(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Cart',
                      style: getMediumStyle(
                          fontSize: 20, color: ColorManager.textColor),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage(
                            IconsAssets.icSearch,
                          ),
                          color: ColorManager.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage(IconsAssets.icCart),
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: Column(
                      children: [
                        Expanded(
                          // the list of cart items ===============
                          child: ListView.separated(
                            itemBuilder: (context, index) => CartItemWidget(
                              imagePath:
                                  "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg",
                              title: '.title!',
                              price: 22,
                              quantity: 22,
                              onDeleteTap: () {},
                              onDecrementTap: (value) {},
                              onIncrementTap: (value) {},
                              size: 40,
                              color: Colors.black,
                              colorName: 'Black',
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.s12.h),
                            itemCount: CartScreenViewModel.get(context)
                                .products
                                .length,
                          ),
                        ),
                        // the total price and checkout button========
                        TotalPriceAndCheckoutBotton(
                          totalPrice: 1200,
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
