import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/app_colors.dart';
import '../../../../product/presentation/pages/product_page.dart';
import '../../bloc/home_bloc.dart';

class BestSellerWidget extends StatefulWidget {
  const BestSellerWidget({Key? key}) : super(key: key);

  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
 }

 class _BestSellerWidgetState extends State<BestSellerWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 138) / 2;
    final double itemWidth = size.width / 2.1;

    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState ) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is HomeLoadedState) {

        return GridView.builder(
            itemCount: state.loadedBestseller.length,
             itemBuilder: (context, index) {
                return GridWidget (
                pictureUrl:state.loadedBestseller[index].picture,
                titleItems: state.loadedBestseller[index].title,
                priceWithoutDiscount: state.loadedBestseller[index].priceWithoutDiscount,
                discountPrice: state.loadedBestseller[index].discountPrice,
                 isFavorites: state.loadedBestseller[index].isFavorites,
                isBestSeller: state.loadedBestseller[index].isBestSeller ?? false,
               id: state.loadedBestseller[index].id, );},
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        );
      }
      if (state is HomeErrorState) {
        return const Center(child: Text('Error getcing bestseller'));
      }
      return const CircularProgressIndicator();
    });
  }
}

class GridWidget extends StatelessWidget {
  final bool? isFavorites;
  final String? titleItems;
  final String? priceWithoutDiscount;
  final String? discountPrice;
  final String? pictureUrl;
  final int? id;
  final bool? isBestSeller;

  const GridWidget({
    Key? key,
    required this.isFavorites,
    required this.titleItems,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.pictureUrl,
    required this.id,
    required this.isBestSeller,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
      return Card(
        margin: const EdgeInsets.all(7),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductDetailsPage()),
            );
          },
          child: Stack(alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  child: CachedNetworkImage(
                    imageUrl: pictureUrl ?? '',
                    height: 235,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(5),
                          minimumSize: const Size(15, 15)),
                      child: isFavorites == true
                          ? const Icon(
                          Icons.favorite, color: AppColors.iconColor, size: 15)
                          : const Icon(
                          Icons.favorite_border, color: AppColors.iconColor,
                          size: 15)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(priceWithoutDiscount.toString(),
                              style: const TextStyle(
                                  fontFamily: 'MarkProbold',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.buttonBarColor)),
                          const SizedBox(width: 20),
                          Text(discountPrice.toString(),
                              style: TextStyle(
                                  fontFamily: 'MarkPronormal400',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      Text(titleItems ?? '',
                          style: const TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.buttonBarColor)),
                    ],
                  ),
                ),
              ]),
        ),);
    }
  }


