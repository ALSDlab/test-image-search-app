import 'package:flutter/cupertino.dart';

import '../repository/image_repository.dart';
import '../ui/main_state.dart';

class ImageViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  ImageViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  MainState _state = const MainState();

  MainState get state => _state;

  Future<void> searchImage(String query) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    _state = state.copyWith(
      isLoading: false,
      imageItems: await _repository.getImageItems(query),
    );

    notifyListeners();
  }
}
