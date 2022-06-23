import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnecal/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.iconData,
    this.isPassword = false,
    this.textEditingController,
    required this.focusNode,
    this.isLast = false,
    this.bottomMargin = 30,
    this.onChanged,
    this.textInputType = TextInputType.text,
    this.validator,
  }) : super(key: key);
  final Function(String)? onChanged;
  final String hintText;
  final IconData iconData;
  final bool isPassword;
  final bool isLast;
  final TextEditingController? textEditingController;
  final FocusNode focusNode;
  final double bottomMargin;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            hintText,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            obscureText: isPassword,
            keyboardType: textInputType,
            textInputAction:
                isLast ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              prefixIcon: Icon(iconData),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(FeatherIcons.eye),
                    )
                  : const SizedBox(),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.whiteColor)
                  .copyWith(
                    color: AppColors.whiteColor.withOpacity(
                      0.5,
                    ),
                  ),
            ),
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
