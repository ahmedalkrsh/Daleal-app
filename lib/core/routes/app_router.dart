// ignore_for_file: constant_identifier_names

import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/prsentation/view/home_view.dart';
import 'package:dalel/features/home/prsentation/widgets/home_nav_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/prsentation/view/historical_prtiods_datails_view.dart';
import '../../features/on_boarding/presentation/views/on_bording_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: RouterNames.OnBoardingView,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: RouterNames.SignUpView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: RouterNames.SignInView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: RouterNames.ForgotPasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: RouterNames.HomeNavBarWidget,
      builder: (context, state) => const HomeNavBarWidget(),
    ),
    GoRoute(
      path: RouterNames.HomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RouterNames.HistoricalPeriodsDetailsView,
      builder: (context, state) => HistoricalPeriodsDetailsView(
        model: state.extra as HistoricalPeriodsModel,
      ),
    ),
  ],
);

class RouterNames {
  static const OnBoardingView = "/onBoarding";
  static const SignUpView = "/signUp";
  static const SignInView = "/signIn";
  static const HomeView = "/home";
  static const ForgotPasswordView = "/forgotPassword";
  static const HomeNavBarWidget = "/homeNavBarWidget";
  static const HistoricalPeriodsDetailsView = "/historicalPeriodsDetailsView";
}
