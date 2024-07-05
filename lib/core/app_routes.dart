import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_screen.dart';
import '../features/splash/presentation/pages/splash_screen.dart';
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
        name: HomeScreen.routeName,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
