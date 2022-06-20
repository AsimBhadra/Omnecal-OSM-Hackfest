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
                const OTPField(),
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

class OTPField extends StatefulWidget {
  const OTPField({Key? key}) : super(key: key);

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: Form(
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0.h,
              horizontal: 30.w,
            ),
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length != 4) {
                  return "Imput the OTP code";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                selectedColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                selectedFillColor: AppColors.whiteColor.withOpacity(0.5),
                inactiveFillColor: AppColors.whiteColor.withOpacity(0.2),
                shape: PinCodeFieldShape.underline,
                borderRadius: BorderRadius.circular(20),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: AppColors.whiteColor.withOpacity(0.7),
                activeColor: Colors.transparent,
              ),
              textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 18,
                    color: AppColors.backgroundColor,
                  ),
              cursorColor: AppColors.whiteColor,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {},
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                return true;
              },
            )),
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
