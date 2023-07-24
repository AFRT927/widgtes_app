import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/progress/progress_screen.dart';
import 'package:widgets_app/presentation/screens/screens.dart';
import 'package:widgets_app/presentation/screens/theme_changer/theme_changer_screen.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      ),

    GoRoute(
      path: '/buttons',
      name: ButtonScreen.name,
      builder: (context, state) => const ButtonScreen(),
      ),

    GoRoute(
      path: '/cards',
      name:CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
      ),

      GoRoute(
      path: '/progress',
      name:ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
      ),

      GoRoute(
      path: '/snackbars',
      name:SnackBarScreen.name,
      builder: (context, state) => const SnackBarScreen(),
      ),

      GoRoute(
      path: '/animated',
      name:AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
      ),

      GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
      ),

      GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name,
      builder: (context, state) => const AppTutorialScreen(),
      ),

      GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.name,
      builder: (context, state) => const InfiniteScrollScreen(),
      ),

      GoRoute(
      path: '/counter-screen',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
      ),

      GoRoute(
      path: '/theme-changer',
      name: ThemeChangerScreen.name,
      builder: (context, state) => const ThemeChangerScreen(),
      )

  ]
  );