import 'package:go_router/go_router.dart';
import '../pages/index.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'business',
          builder: (context, state) => const StudioPage(),
          routes: [
            GoRoute(
              path: 'studio',
              builder: (context, state) => const StudioPage(),
            ),
            GoRoute(
              path: 'smartclass',
              builder: (context, state) => const SmartClassroomPage(),
            ),
            GoRoute(
              path: 'hybrid',
              builder: (context, state) => const HybridLearningPage(),
            ),
            GoRoute(
              path: 'platform',
              builder: (context, state) => const RegionalPlatformPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'service',
          builder: (context, state) => const ServicePage(),
        ),
        GoRoute(
          path: 'about',
          builder: (context, state) => const AboutPage(),
          routes: [
            GoRoute(
              path: 'portfolio',
              builder: (context, state) => const PortfolioPage(),
            ),
            GoRoute(
              path: 'contact',
              builder: (context, state) => const ContactPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
