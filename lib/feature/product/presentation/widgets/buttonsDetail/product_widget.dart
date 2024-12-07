import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';
import 'buttons_product_widgets.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
            SvgPicture.asset(
              assetGroup18,
              height: 40,
              fit: BoxFit.contain,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child:
              Text(
                'Select color and capacity',
                style: TextStyle(
                  height: 5,
                  fontFamily: 'MarkPronormal400',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.buttonBarColor,
                ),
              ),
            ),
         const Expanded(
            child: ButtonsProductWidget()),
                  ],
    );
  }


}