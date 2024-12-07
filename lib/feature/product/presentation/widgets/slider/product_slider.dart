import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product_bloc.dart';


class ProductSliderWidget extends StatefulWidget {
  const ProductSliderWidget({Key? key}) : super(key: key);

  @override
  _ProductSliderWidgetState createState() => _ProductSliderWidgetState();
}

class _ProductSliderWidgetState extends State<ProductSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoadedState) {
          final images = state.loadedProduct[0].images!;
          return CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (context, index, _) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ModelWidget(
                  images: images[index],
                  color: state.loadedProduct[0].color!,
                  capacity: state.loadedProduct[0].capacity!,
                  price: state.loadedProduct[0].price!,
                ),
              );
            },
            options: CarouselOptions(
              height: 320,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
          );
        }
        if (state is ProductErrorState) {
          return const Center(child: Text('Error getting picture'));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class ModelWidget extends StatelessWidget {
  final String? images;
  final String? color;
  final String? capacity;
  final String? price;

  const ModelWidget({
    Key? key,
    required this.images,
    required this.color,
    required this.capacity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(images ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}