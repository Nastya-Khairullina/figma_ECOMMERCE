import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/feature/product/data/datasources/cart_page_userchange.dart';
import '../../../../../common/app_colors.dart';
import '../../bloc/product_bloc.dart';
import '../../pages/cart_page.dart';

class ButtonsProductWidget extends StatefulWidget {
  const ButtonsProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonsProductWidget> createState() => _ButtonsProductWidgetState();
}
class _ButtonsProductWidgetState extends State<ButtonsProductWidget> {

  int selectedButtonColor = 0;
  int selectedButtonNum = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoadedState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn1",
                      elevation: 0,
                      child: selectedButtonColor == 0
                          ? const Icon(
                        Icons.check_outlined,
                      )
                          : const SizedBox(),
                      backgroundColor: Color(int.parse(state.loadedProduct[0].color!)),
                      foregroundColor: Colors.white,
                      onPressed: () =>
                          setState(() {
                            selectedButtonColor = 0;
                          }),
                    ),
                  ),),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      elevation: 0,
                      child: selectedButtonColor == 1
                          ? const Icon(
                        Icons.check_outlined,
                      )
                          : const SizedBox(),
                      backgroundColor: const Color(0xff010035),
                      foregroundColor: Colors.white,
                      onPressed: () => setState(() {
                        selectedButtonColor = 1;
                      }),
                    ),
                  ),),
                  const SizedBox(width: 60),
                  ElevatedButton(
                    child: Text(
                      '128 GB',
                      style: TextStyle(
                        color: selectedButtonNum == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                    onPressed: () => {
                      setState(() {
                        selectedButtonNum = 0;
                      })
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButtonNum == 0 ? AppColors.iconColor : Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.all(7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: Text(
                      state.loadedProduct[0].capacity!.toString(),
                      style: TextStyle(
                        color: selectedButtonNum == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                    onPressed: () => {
                      setState(() {
                        selectedButtonNum = 1;
                      })
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButtonNum == 1 ? AppColors.iconColor : Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                final cartDataProvider = Provider.of<CartDataProvider>(context, listen: false);
                 cartDataProvider.add(state.loadedProduct[0]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartWidget()
                    ),
                  );
                },
                child:  Text(
                  'Add to Cart' + state.loadedProduct[0].price.toString(),
                  style: const TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.iconColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 60),
                ),
              ),
            ],
          );
        }
        if (state is ProductErrorState) {
          return const Center(
            child: Text('Error getcing details'),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}