import 'package:bar_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: StepOneScreen.name,
      builder: (context, state) => const StepOneScreen(),
      routes: [])
]);
