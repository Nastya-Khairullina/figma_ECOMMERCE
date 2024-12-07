import 'package:flutter/material.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';
import '../filter/filter_wigets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 34,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: 'Search',
                hintStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'MarkPronormal400',
                    fontWeight: FontWeight.w400
                ),
                prefixIcon: svgSearch,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const FilterWidget();
                }
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: AppColors.iconColor,
          ),
          child: svgQrcode,
        )
      ],
    );
  }
}