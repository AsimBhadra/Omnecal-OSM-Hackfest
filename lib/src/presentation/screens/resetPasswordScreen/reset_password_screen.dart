part of screens;

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ResetPasswordScreenHeader(),
              ResetPasswordScreenForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordScreenHeader extends StatelessWidget {
  const ResetPasswordScreenHeader({Key? key}) : super(key: key);

  static const String createProfileText = 'Reset Password';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 154.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
          Text(
            createProfileText,
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}

class ResetPasswordScreenForm extends StatefulWidget {
  const ResetPasswordScreenForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreenForm> createState() =>
      _ResetPasswordScreenFormState();
}

class _ResetPasswordScreenFormState extends State<ResetPasswordScreenForm> {
  final IconButtonController resetPasswordController = IconButtonController();

  String phone = "", password = "", confirmPassword = "";

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          CustomTextField(
            hintText: 'Phone',
            iconData: FeatherIcons.smartphone,
            onChanged: (String value) {
              if (value.length == 10) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              setState(() {
                phone = value;
              });
            },
            focusNode: phoneFocusNode,
            textInputType: TextInputType.number,
          ),
          // CustomTextField(
          //   hintText: 'Create Password',
          //   iconData: FeatherIcons.lock,
          //   isPassword: true,
          //   onChanged: (String value) {
          //     setState(() {
          //       password = value;
          //     });
          //   },
          //   focusNode: passwordFocusNode,
          //   isLast: false,
          // ),
          // CustomTextField(
          //   hintText: 'Confirm Password',
          //   iconData: FeatherIcons.lock,
          //   isPassword: true,
          //   onChanged: (String value) {
          //     setState(() {
          //       confirmPassword = value;
          //     });
          //   },
          //   focusNode: confirmPasswordFocusNode,
          //   isLast: true,
          // ),
          resetPasswordController.currentState == ButtonState.error
              ? const Text('Failed to auto-verify')
              : const SizedBox.shrink(),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: IconLoadingButton(
              color: AppColors.mainSwatch,
              iconColor: AppColors.whiteColor,
              valueColor: AppColors.mainSwatch,
              errorColor: AppColors.redColor,
              successColor: AppColors.greenColor,
              iconData: PhosphorIcons.lockFill,
              onPressed: () {
                if (phone.length == 10) {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      resetPasswordController.error();
                    });

                    Future.delayed(const Duration(seconds: 1), () {
                      context.router.replaceNamed('/o-tp-screen');
                    });
                  });
                } else {
                  resetPasswordController.reset();
                }
              },
              successIcon: PhosphorIcons.check,
              controller: resetPasswordController,
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
