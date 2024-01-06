import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_image_search_app/ui/main_screen.dart';
import 'package:test_image_search_app/view_model/image_view_model.dart';

import 'di/di_setup.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => ChangeNotifierProvider(
      create: (_) => getIt<ImageViewModel>(),
      child: const MainScreen(),
    ),
  ),
]);
