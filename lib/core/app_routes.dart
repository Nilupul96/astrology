import 'package:astrology/features/auth/domain/entities/user.dart';
import 'package:astrology/features/onboarding/presentation/pages/add_birthday_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/onboarding_succsess_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/set_name_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/set_zodiac_sign_screen.dart';
import 'package:astrology/features/settings/presentation/pages/settings_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/sign_in_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../splash_screen.dart';
import 'helpers/navigation_service.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/set-name',
    navigatorKey: NavigationService.navigatorKey,
    routes: [
      GoRoute(
        name: SplashScreen.routeName,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: SignInScreen.routeName,
        path: '/login',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AddBirthDayScreen.routeName,
        path: '/add-birthday',
        builder: (context, state) => const AddBirthDayScreen(),
      ),
      GoRoute(
        name: SetNameScreen.routeName,
        path: '/set-name',
        builder: (context, state) => const SetNameScreen(),
      ),
      GoRoute(
        name: SetZodiacScreen.routeName,
        path: '/set-zodiac',
        builder: (context, state) => const SetZodiacScreen(),
      ),
      GoRoute(
        name: OnboardingSuccessScreen.routeName,
        path: '/onboarding-success',
        builder: (context, state) => const OnboardingSuccessScreen(),
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: '/home',
        builder: (context, state) => HomeScreen(
          user: state.extra as UserEntity?,
        ),
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
