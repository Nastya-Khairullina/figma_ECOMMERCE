import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/feature/product/data/datasources/cart_page_userchange.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/svg_icons.dart';
import '../bloc/product_bloc.dart';
import '../widgets/Cart/cart_items_widget.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoadedState) {
            return SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  size: 19,
                                  color: Colors.white
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonBarColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.all(10),
                                minimumSize: const Size(15, 15),
                              ),
                            ),
                            const SizedBox(width: 140),
                            const Text('Add address',
                                style: TextStyle(
                                    fontFamily: 'MarkPronormal400',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.buttonBarColor
                                )
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: SvgPicture.asset(
                                assetGeolocation,
                                color: Colors.white,
                                height: 18,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.iconColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10
                                  ),
                                  minimumSize: const Size(15, 16)
                              ),
                            ),
                          ]
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                            'My Cart',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'MarkPronormal700',
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: AppColors.buttonBarColor
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                        height: 680,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: AppColors.buttonBarColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)
                            )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 10),
                              child: SizedBox(
                               height: 300,
                                child: Consumer<CartDataProvider>(
                                  builder: (context, cartProvider, child) {
                                    return ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: cartProvider.cartItems.length,
                                        itemBuilder: (context, index) {
                                            return CartItemsWidget(
                                              images: cartProvider.cartItems[index].product.images.isNotEmpty
                                                  ? cartProvider.cartItems[index].product.images[0]
                                                  : null,
                                              price: cartProvider.cartItems[index].product.price,
                                              title: cartProvider.cartItems[index].product.title,
                                              color: cartProvider.cartItems[index].product.color,
                                              id: cartProvider.cartItems[index].product.id,
                                            );
                                          }

                                        );},
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 65
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                      'Total',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey
                                      )
                                  ),
                                  Text(
                                      Provider.of<CartDataProvider>(context).calculateTotalCartValue(),
                                      style: const TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 65
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Delivery',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.grey
                                      )
                                  ),
                                  Text(
                                      'Free',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal700',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white
                                      )
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            const Expanded(child: SizedBox()),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Checkout',
                                style: TextStyle(
                                  fontFamily: 'MarkPronormal400',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.iconColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 115
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        )
                    )
                  ]
              ),
            );
          }
          if (state is ProductErrorState) {
            return const Center(child: Text('Error getcing details'));
          }
          return const CircularProgressIndicator();
        }
        )
    );
  }
}