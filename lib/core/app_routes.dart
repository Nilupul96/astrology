import 'package:astrology/features/auth/domain/entities/user.dart';
import 'package:astrology/features/home/presentation/pages/profile_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/add_birthday_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/onboarding_succsess_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/set_name_screen.dart';
import 'package:astrology/features/onboarding/presentation/pages/set_zodiac_sign_screen.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/pages/people_prediction_screen.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/pages/zodiac_list_screen.dart';
import 'package:astrology/features/predictions/prediction_init_screen.dart';
import 'package:astrology/features/settings/presentation/pages/settings_screen.dart';
import 'package:astrology/init_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/sign_in_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../splash_screen.dart';
import 'helpers/navigation_service.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
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
        name: InitScreen.routeName,
        path: '/init',
        builder: (context, state) => const InitScreen(),
      ),
      GoRoute(
        name: HomeScreen.routeName,
        path: '/home',
        builder: (context, state) => HomeScreen(
          user: state.extra as UserEntity?,
        ),
      ),
      GoRoute(
        name: ProfileScreen.routeName,
        path: '/profile',
        builder: (context, state) => ProfileScreen(
          user: state.extra as UserEntity,
        ),
      ),
      GoRoute(
          name: PredictionInitScreen.routeName,
          path: '/predictions',
          builder: (context, state) => const PredictionInitScreen(),
          routes: [
            GoRoute(
              name: ZodiacSignListScreen.routeName,
              path: 'zodiac-list',
              builder: (context, state) => const ZodiacSignListScreen(),
            ),
            GoRoute(
              name: PeoplePredictionsResultScreen.routeName,
              path: 'people-predictions',
              builder: (context, state) => PeoplePredictionsResultScreen(
                zodiacSign: (state.extra as Map)['sign'],
                personalBehavior: (state.extra as Map)['behavior'],
              ),
            ),
          ]),
      GoRoute(
        name: SettingsScreen.routeName,
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
