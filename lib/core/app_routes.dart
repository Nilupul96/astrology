import 'package:astrology/features/login/presentation/pages/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_screen.dart';
import '../features/splash/presentation/pages/splash_screen.dart';
import 'helpers/navigation_service.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/login',
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
        name: HomeScreen.routeName,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
