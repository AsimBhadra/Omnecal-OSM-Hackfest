part of screens;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(FeatherIcons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.search),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/550x/09/52/59/0952599f80ce061278a8b6de1bb434fd.jpg'),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                FeatherIcons.x,
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Close',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              leading: const Icon(FeatherIcons.userCheck),
              title: Text(
                'Profile',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.calendar),
              title: Text(
                'Calendar',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.bookmark),
              title: Text(
                'Saved',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(PhosphorIcons.arrowCounterClockwise),
              title: Text(
                'Trip History',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/language.svg',
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Preferences',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColors.whiteColor),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.info),
              title: Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/tool.svg',
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Support',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/activity.svg',
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Activity Logs',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.share2),
              title: Text(
                'Share',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Account',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColors.whiteColor),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.settings),
              title: Text(
                'Settings & Privacy',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.helpCircle),
              title: Text(
                'Help',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/icons/report.svg',
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Report a problem',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              leading: const Icon(FeatherIcons.logOut),
              title: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        navBarStyle: NavBarStyle.style6,
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundColor,
        screens: const [
          MainScreen(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Elusive.home),
            title: ("Home"),
            activeColorPrimary: AppColors.mainSwatch,
            inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.75),
            iconSize: 16.sp,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10.sp,
                ),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Elusive.group),
            title: ("Community"),
            activeColorPrimary: AppColors.mainSwatch,
            inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.75),
            iconSize: 16.sp,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10.sp,
                ),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(MfgLabs.newspaper),
            title: ("News"),
            activeColorPrimary: AppColors.mainSwatch,
            inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.75),
            iconSize: 16.sp,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10.sp,
                ),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(PhosphorIcons.calendarCheck),
            title: ("Schedule"),
            activeColorPrimary: AppColors.mainSwatch,
            inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.75),
            iconSize: 16.sp,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10.sp,
                ),
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Elusive.bell),
            title: ("Notifications"),
            activeColorPrimary: AppColors.mainSwatch,
            inactiveColorPrimary: AppColors.whiteColor.withOpacity(0.75),
            iconSize: 16.sp,
            textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 10.sp,
                ),
          ),
        ],
        controller: _controller,
      ),
    );
  }
}
