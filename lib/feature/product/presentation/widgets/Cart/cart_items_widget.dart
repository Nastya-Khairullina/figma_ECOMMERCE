import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/feature/product/data/datasources/cart_page_userchange.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';

class CartItemsWidget extends StatefulWidget   {
  final String? images;
  final String? price;
  final String? color;
  final String? title;
  final int? id;

  const CartItemsWidget({
    Key? key,
    required this.images,
    required this.price,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  @override
  State<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 20),
        color: AppColors.buttonBarColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
                height: 300,
                child: Consumer<CartDataProvider>(
                builder: (context, cartProvider, child) {
                  if (cartProvider.cartItems.isEmpty) {
                    return const Center(child: Text('Корзина пуста.'));
                  }
                  return ListView.builder(
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartProvider.cartItems[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadiusDirectional
                                            .circular(12)
                                    ),
                                    height: 95,
                                    width: 95,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CachedNetworkImage(
                                          imageUrl: item.product.images.isNotEmpty
                                              ? (item.product.images[0] ?? '')
                                              : '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: Text(
                                            item.product.title ?? '',
                                            maxLines: 3,
                                            style: const TextStyle(
                                                fontSize: 21,
                                                fontFamily: 'MarkPronormal400',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 7,),
                                        Text(
                                          item.product.price.toString(),
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 21,
                                              fontFamily: 'MarkPronormal400',
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.iconColor
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Container(
                                      height: 100,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: AppColors.containerColor,
                                          borderRadius: BorderRadiusDirectional
                                              .circular(12)
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                final cartProvider = Provider
                                                    .of<CartDataProvider>(
                                                    context, listen: false);
                                                cartProvider.decrement(item);
                                              },
                                              icon: svgMinus,
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                Provider.of<CartDataProvider>(
                                                    context, listen: false)
                                                    .decrement(item);
                                              },
                                              icon: Text(
                                                '${item.quantity}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              onPressed: () {
                                                Provider.of<CartDataProvider>(
                                                    context, listen: false).add(
                                                    item.product);
                                              },
                                              icon: svgPlus,
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Подтверждение удаления'),
                                            content: const Text(
                                                'Вы действительно хотите очистить корзину?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Отмена'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Очистить'),
                                                onPressed: () {
                                                  Provider.of<CartDataProvider>(
                                                      context, listen: false)
                                                      .clear();
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      backgroundColor: AppColors.buttonBarColor,
                                    ),
                                    child: SvgPicture.asset(
                                      assetCart,
                                      height: 18,
                                    ),
                                  ),
                                ]
                            )
                        );
                      }
                  );
                })
    )));
  }
}
