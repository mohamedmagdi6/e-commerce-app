import 'package:e_commerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_states.dart';
import 'package:e_commerce_app/features/products_screen/presentation/screens/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_product_widget.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsScreenViewModel, ProductsScreenStates>(
        listener: (context, state) {
          if (state is AddProductToCartLoadingState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('loading ..')));
          } else if (state is AddProductToCartFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error')));
          } else if (state is AddProductToCartSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('success')));
          }
        },
        bloc: ProductsScreenViewModel.get(context)..getAllProduts(),
        builder: (context, state) {
          return ProductsScreenViewModel.get(context).products.isEmpty
              ? Skeletonizer(
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: 20,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 7 / 9,
                              ),
                              itemBuilder: (context, index) {
                                return CustomProductWidget();
                              },
                              scrollDirection: Axis.vertical,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 7 / 9,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          productDataEntity:
                                              ProductsScreenViewModel.get(
                                                      context)
                                                  .products[index])));
                                },
                                child: CustomProductWidget(
                                  productDataEntity:
                                      ProductsScreenViewModel.get(context)
                                          .products[index],
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}
