import 'package:test_image_search_app/mapper/image_mapper.dart';

import '../model/image_model.dart';
import '../source/image_source.dart';
import 'image_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    final dto = await _api.getImageItems(query);

    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}

class MockImageItemRepositoryImpl implements ImageItemRepository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    await Future.delayed(const Duration(seconds: 1));

    if (query == 'apple') {
      return [
        ImageItem(
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/09/26/13/39/apples-2788651_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
            tags: ''),
      ];
    } else {
      return [
        ImageItem(
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg",
            tags: ''),
        ImageItem(
            imageUrl:
                "https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg",
            tags: ''),
      ];
    }
  }
}
