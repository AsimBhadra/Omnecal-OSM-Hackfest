// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../../screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    CreateProfileScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CreateProfileScreen());
    },
    ResetPasswordScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ResetPasswordScreen());
    },
    OTPScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OTPScreen());
    },
    HomeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    PlanTripScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PlanTripScreen());
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashScreen.name, path: '/'),
        _i2.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i2.RouteConfig(CreateProfileScreen.name,
            path: '/create-profile-screen'),
        _i2.RouteConfig(ResetPasswordScreen.name,
            path: '/reset-password-screen'),
        _i2.RouteConfig(OTPScreen.name, path: '/o-tp-screen'),
        _i2.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i2.RouteConfig(PlanTripScreen.name, path: '/plan-trip-screen'),
        _i2.RouteConfig(TripPlannerScreen.name, path: '/trip-planner-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i2.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i2.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i1.CreateProfileScreen]
class CreateProfileScreen extends _i2.PageRouteInfo<void> {
  const CreateProfileScreen()
      : super(CreateProfileScreen.name, path: '/create-profile-screen');

  static const String name = 'CreateProfileScreen';
}

/// generated route for
/// [_i1.ResetPasswordScreen]
class ResetPasswordScreen extends _i2.PageRouteInfo<void> {
  const ResetPasswordScreen()
      : super(ResetPasswordScreen.name, path: '/reset-password-screen');

  static const String name = 'ResetPasswordScreen';
}

/// generated route for
/// [_i1.OTPScreen]
class OTPScreen extends _i2.PageRouteInfo<void> {
  const OTPScreen() : super(OTPScreen.name, path: '/o-tp-screen');

  static const String name = 'OTPScreen';
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i2.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i1.PlanTripScreen]
class PlanTripScreen extends _i2.PageRouteInfo<void> {
  const PlanTripScreen()
      : super(PlanTripScreen.name, path: '/plan-trip-screen');

  static const String name = 'PlanTripScreen';
}

/// generated route for
/// [_i1.TripPlannerScreen]
class TripPlannerScreen extends _i2.PageRouteInfo<void> {
  const TripPlannerScreen()
      : super(TripPlannerScreen.name, path: '/trip-planner-screen');

  static const String name = 'TripPlannerScreen';
}
