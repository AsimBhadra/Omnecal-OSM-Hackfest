part of screens;

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CreateProfileScreenHeader(),
                CreateProfileScreenForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateProfileScreenHeader extends StatelessWidget {
  const CreateProfileScreenHeader({Key? key}) : super(key: key);

  static const String createProfileText = 'Create Your Profile';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
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

class CreateProfileScreenForm extends StatefulWidget {
  const CreateProfileScreenForm({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreenForm> createState() =>
      _CreateProfileScreenFormState();
}

class _CreateProfileScreenFormState extends State<CreateProfileScreenForm> {
  List<String> languages = ['English', 'नेपाली'];
  List<String> categories = ['Operator', 'Owner'];

  String selectedLanguage = 'English';
  String selectedCategory = 'Operator';

  final IconButtonController signUpController = IconButtonController();

  final TextEditingController usernameOrEmailController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode usernameOrEmailFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Language',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 124.w,
                    height: 44.h,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: Divider(
                        color: AppColors.whiteColor.withOpacity(0.8),
                        height: 0.h,
                        thickness: 2.h,
                      ),
                      icon: const Icon(FeatherIcons.chevronDown),
                      value: selectedLanguage,
                      items: languages.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/flags/$value.png',
                                height: 16.h,
                                width: 19.w,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              Text(
                                value,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.whiteColor.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 124.w,
                    child: DropdownButton<String>(
                      underline: Divider(
                        color: AppColors.whiteColor
                            .withOpacity(0.6)
                            .withOpacity(0.2),
                        height: 0.h,
                        thickness: 2.h,
                      ),
                      icon: const Icon(FeatherIcons.chevronDown),
                      value: selectedCategory,
                      items: categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              const Icon(FeatherIcons.user),
                              SizedBox(
                                width: 11.w,
                              ),
                              Text(
                                value,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'Username or Email',
            iconData: FeatherIcons.user,
            textEditingController: usernameOrEmailController,
            focusNode: usernameOrEmailFocusNode,
          ),
          CustomTextField(
            hintText: 'Phone Number',
            iconData: FeatherIcons.smartphone,
            textEditingController: phoneNumberController,
            focusNode: phoneNumberFocusNode,
          ),
          CustomTextField(
            hintText: 'Password',
            iconData: FeatherIcons.lock,
            isPassword: true,
            textEditingController: passwordController,
            focusNode: passwordFocusNode,
            isLast: false,
          ),
          CustomTextField(
            hintText: 'Confirm Password',
            iconData: FeatherIcons.lock,
            isPassword: true,
            textEditingController: confirmPasswordController,
            focusNode: confirmPasswordFocusNode,
            isLast: true,
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
                if (usernameOrEmailController.text.isNotEmpty) {
                  context.router.pushNamed('/home-screen');
                } else {
                  signUpController.reset();
                }
              },
              successIcon: PhosphorIcons.check,
              controller: signUpController,
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
