part of screens;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                LoginScreenLocation(),
                LoginScreenHeader(),
                LoginScreenForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreenLocation extends StatelessWidget {
  const LoginScreenLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 27.h, left: 15.w),
      child: Row(
        children: <Widget>[
          const Icon(
            FeatherIcons.mapPin,
          ),
          SizedBox(
            width: 11.w,
          ),
          Text(
            'Kathmandu, Nepal',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({Key? key}) : super(key: key);

  static const String welcomeText = 'Welcome To Omnecal';
  static const String welcomeSubText =
      'Let’s make our home better place to live';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 66.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            welcomeText,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            welcomeSubText,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.whiteColor.withOpacity(
                    0.6,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({Key? key}) : super(key: key);

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  final FocusNode usernameOrEmailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final IconButtonController loginButtonController = IconButtonController();

  String username = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              hintText: 'Username or Email or Phone',
              iconData: FeatherIcons.user,
              focusNode: usernameOrEmailFocusNode,
              validator: (String? value) {
                if (value!.isEmpty) return 'Mandatory Field';

                return null;
              },
              onChanged: (String value) {
                setState(() {
                  username = value;
                });
              },
              bottomMargin: 15.h,
            ),
            CustomTextField(
              hintText: 'Password',
              iconData: FeatherIcons.lock,
              isPassword: true,
              focusNode: passwordFocusNode,
              isLast: false,
              bottomMargin: 15.h,
              validator: (String? value) {
                if (value!.isEmpty) return 'Mandatory Field';

                return null;
              },
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.6),
                      ),
                ),
                InkWell(
                  onTap: () {
                    context.router.pushNamed('/reset-password-screen');
                  },
                  child: Text(
                    ' Reset Password',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: IconLoadingButton(
                color: AppColors.mainSwatch,
                iconColor: AppColors.whiteColor,
                valueColor: AppColors.mainSwatch,
                errorColor: AppColors.redColor,
                successColor: AppColors.greenColor,
                iconData: PhosphorIcons.googleLogo,
                onPressed: () {},
                successIcon: PhosphorIcons.check,
                controller: loginButtonController,
                child: Text(
                  'Login with Google',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.6),
                      ),
                ),
                InkWell(
                  onTap: () {
                    context.router.pushNamed('/create-profile-screen');
                  },
                  child: Text(
                    ' Sign up',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
