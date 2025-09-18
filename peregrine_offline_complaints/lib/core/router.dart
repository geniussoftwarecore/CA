import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../screens/role_selection_screen.dart';
import '../screens/pin_entry_screen.dart';
import '../screens/client/client_home_screen.dart';
import '../screens/support/support_home_screen.dart';
import '../screens/coordination/coordination_home_screen.dart';
import '../screens/complaint_form/complaint_form_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/pin-entry/:role',
        builder: (context, state) => PinEntryScreen(
          role: state.pathParameters['role']!,
        ),
      ),
      GoRoute(
        path: '/client',
        builder: (context, state) => const ClientHomeScreen(),
      ),
      GoRoute(
        path: '/support',
        builder: (context, state) => const SupportHomeScreen(),
      ),
      GoRoute(
        path: '/coordination',
        builder: (context, state) => const CoordinationHomeScreen(),
      ),
      GoRoute(
        path: '/complaint-form',
        builder: (context, state) => const ComplaintFormScreen(),
      ),
    ],
  );
});