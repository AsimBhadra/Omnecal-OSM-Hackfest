import 'package:flutter/material.dart';
import 'package:omnecal/src/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: AppColors.whiteColor,
      ),
    );
  }
}
