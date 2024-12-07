import 'package:flutter/material.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/svg_icons.dart';
import '../filter/filter_wigets.dart';

class GeolocationWidget extends StatelessWidget {
  const GeolocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: svgGeolocation,
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: Colors.grey[50],
                  elevation: 0
              ),
            ),
            const Text(
                'Zihuatanejo, Gro',
                style: TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.buttonBarColor
                )
            ),
            ElevatedButton(
              onPressed: () {},
              child: svgDown,
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: Colors.grey[50],
                  elevation: 0
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const FilterWidget();
              }
          );},
          child: svgFilter,
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: Colors.grey[50],
              elevation: 0
          ),
        ),
      ],
    );
  }
}