import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/custom_icons.dart';
import '../bloc/product_bloc.dart';
import '../widgets/shopBar/shopbar_widgets.dart';
import '../widgets/slider/product_slider.dart';
import 'cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 19, color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonBarColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            minimumSize: const Size(15, 15),
                          ),
                        ),
                        const Text(
                          'Product Details',
                          style: TextStyle(
                            fontFamily: 'MarkPronormal400',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.buttonBarColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartWidget(),
                              ),
                            );
                          },
                          child: const Icon(
                            CustomIcons.vector,
                            color: Colors.white,
                            size: 17,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.iconColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(11),
                            minimumSize: const Size(15, 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ProductSliderWidget(),
                  const SizedBox(height: 5),
                  Container(
                    height: 440,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.loadedProduct[0].title!,
                                style: const TextStyle(
                                  fontFamily: 'MarkPronormal400',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: AppColors.buttonBarColor,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: state.loadedProduct[0].isFavorites == true
                                    ? const Icon(Icons.favorite, color: AppColors.iconColor, size: 18)
                                    : const Icon(Icons.favorite_border, color: AppColors.iconColor, size: 15),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.buttonBarColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 9,),
                                  minimumSize: const Size(7, 7),
                                ),
                              ),
                            ],
                          ),
                          RatingBar.builder(
                            itemSize: 22,
                            initialRating: state.loadedProduct[0].rating!.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating1) {
                            },
                          ),
                          const SizedBox(height: 25),
                          const ShopBarWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProductErrorState) {
            return const Center(
              child: Text('Error getcing details'),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}