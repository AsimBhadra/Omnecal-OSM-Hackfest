part of screens;

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OTPScreenHeader(),
                OTPField(),
                OTPOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPScreenHeader extends StatelessWidget {
  const OTPScreenHeader({Key? key}) : super(key: key);

  static const String createProfileText = 'Verifying your identity';
  static const String createProfileSubText =
      'Waiting to automatically detect on SMS sent to 98******** or ****@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120.h, left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createProfileText,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            createProfileSubText,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: AppColors.whiteColor.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}

class OTPField extends StatelessWidget {
  OTPField({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.dmSans(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
  );

  final lol = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.dmSans(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 2.h,
          color: AppColors.whiteColor.withOpacity(0.2),
        ),
      ),
    ),
  );

  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 65.w,
        height: 2.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
        ),
      ),
    ],
  );

  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 65.w,
        height: 2.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Center(
        child: Pinput(
          length: 4,
          pinAnimationType: PinAnimationType.slide,
          controller: controller,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          showCursor: true,
          cursor: cursor,
          preFilledWidget: preFilledWidget,
          hapticFeedbackType: HapticFeedbackType.mediumImpact,
          submittedPinTheme: lol,
        ),
      ),
    );
  }
}

class OTPOptions extends StatelessWidget {
  OTPOptions({Key? key}) : super(key: key);
  final IconButtonController signUpController = IconButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Icon(
                  FeatherIcons.messageCircle,
                  color: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Resend Code",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  "1:06",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(
              color: AppColors.whiteColor.withOpacity(0.5),
              thickness: 1.h,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Icon(
                  FeatherIcons.phoneCall,
                  color: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  "Wrong Contact Details?",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          Center(
            child: IconLoadingButton(
              color: AppColors.mainSwatch,
              iconColor: AppColors.whiteColor,
              valueColor: AppColors.mainSwatch,
              errorColor: AppColors.redColor,
              successColor: AppColors.greenColor,
              iconData: PhosphorIcons.signIn,
              onPressed: () {
                context.router.replaceNamed('/home-screen');
              },
              successIcon: PhosphorIcons.check,
              controller: signUpController,
              child: Text(
                'Confirm',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
