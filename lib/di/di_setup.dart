import 'package:get_it/get_it.dart';
import 'package:test_image_search_app/repository/image_repository.dart';
import 'package:test_image_search_app/view_model/image_view_model.dart';

import '../repository/image_repository_impl.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());
  getIt.registerFactory<ImageViewModel>(
      () => ImageViewModel(repository: getIt<ImageItemRepository>()));
}
