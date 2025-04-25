import 'package:go_router/go_router.dart';
import '../pages/index.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/business/studio',
      builder: (context, state) => const StudioPage(),
    ),
    GoRoute(
      path: '/business/smartclass',
      builder: (context, state) => const SmartClassroomPage(),
    ),
    GoRoute(
      path: '/business/hybrid',
      builder: (context, state) => const HybridLearningPage(),
    ),
    GoRoute(
      path: '/business/platform',
      builder: (context, state) => const RegionalPlatformPage(),
    ),
    GoRoute(path: '/service', builder: (context, state) => const ServicePage()),
    GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
    GoRoute(
      path: '/about/portfolio',
      builder: (context, state) => const PortfolioPage(),
    ),
    GoRoute(
      path: '/about/contact',
      builder: (context, state) => const ContactPage(),
    ),
  ],
);
