import 'package:flutter/material.dart';
import '../../../../common/app_colors.dart';
import '../widgets/bestseller/bestseller_widgets.dart';
import '../widgets/geolocation/geolocation_widgets.dart';
import '../widgets/hotsales/hotsales_widgets.dart';
import '../widgets/search/search_widgets.dart';
import '../widgets/select_category/select_category_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 45),
            GeolocationWidget(),
            _TitleSelectCategory(),
            SizedBox(height: 15),
            SelectCategoryWidget(),
            SizedBox(height: 10),
            SearchWidget(),
            SizedBox(height: 15),
            _TitleHotSales(),
            SizedBox(height: 20),
            HotSalesWidget(),
            SizedBox(height: 10),
            _TitleBestSeller(),
            BestSellerWidget(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



class _TitleSelectCategory extends StatelessWidget {
  const _TitleSelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Select Category',
          style: TextStyle(fontSize: 25, color: AppColors.buttonBarColor),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'view all',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'MarkPronormal400',
                fontWeight: FontWeight.w500,
                color: AppColors.iconColor
            ),
          ),
        )
      ],
    );
  }
}

class _TitleHotSales extends StatelessWidget {
  const _TitleHotSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hot Sales',
          style: TextStyle(fontSize: 25, color: AppColors.buttonBarColor),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'see more',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'MarkPronormal400',
                fontWeight: FontWeight.w500,
                color: AppColors.iconColor
            ),
          ),
        )
      ],
    );
  }
}

class _TitleBestSeller extends StatelessWidget {
  const _TitleBestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Best Seller',
          style: TextStyle(fontSize: 25, color: AppColors.buttonBarColor),
        ),
        TextButton(
          child: const Text(
            'see more',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'MarkPronormal400',
                fontWeight: FontWeight.w500,
                color: AppColors.iconColor
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}