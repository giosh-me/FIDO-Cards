import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fido_cards/features/onboarding/onboarding_screen.dart';
import 'package:fido_cards/features/cards/ui/home_screen.dart';
import 'package:fido_cards/features/cards/ui/add_card_screen.dart';
import 'package:fido_cards/features/cards/ui/card_detail_screen.dart';
import 'package:fido_cards/features/settings/settings_screen.dart';

/// Gestore delle rotte dell'applicazione usando GoRouter.
class AppRouter {
  // Chiave globale per il navigator (utile per dialoghi o overlay globali)
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router({required bool onboardingDone}) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      // Se l'onboarding è fatto, vai alla home, altrimenti flow di benvenuto
      initialLocation: onboardingDone ? '/' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'add',
              builder: (context, state) => const AddCardScreen(),
            ),
            GoRoute(
              path: 'card/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return CardDetailScreen(cardId: id);
              },
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
