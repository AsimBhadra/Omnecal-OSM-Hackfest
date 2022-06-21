import 'package:auto_route/auto_route.dart';
import 'package:omnecal/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: CreateProfileScreen),
    AutoRoute(page: ResetPasswordScreen),
    AutoRoute(page: OTPScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: PlanTripScreen),
  ],
)
class $AppRouter {}
