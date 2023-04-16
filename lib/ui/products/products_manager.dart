import '../../models/products.dart';
import 'package:flutter/foundation.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Mèo cỏ',
      description:
          'Là một giống loài đến từ khu vực châu Á. Thân hình khá nhỏ nhắn nên được nhiều các bạn nữ yêu mến',
      price: 199.00,
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/07/25/01/22/cat-2536662_1280.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Chó Husky',
      description:
          'Luôn nằm trong top giống chó được yêu thích. Husky sẽ luôn là lựa chọn hàng đầu với nhiều người yêu thú cưng',
      price: 478.01,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/08/18/00/40/siberian-husky-6554345_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Mèo anh lông dài',
      description:
          'Là giông mèo được ưa chuộng bởi các quý tộc anh, khoác lên mình bộ lông xinh đẹp Mèo anh lông dài đã chinh phục được rất nhiều người ưa thích.',
      price: 350.09,
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/04/26/19/17/cat-3352842_1280.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Chó Shiba Inu',
      description:
          'Là giống đến từ vùng đất mặt trời mọc - Nhật bản. Đảm bảo cậu bạn này sẽ không bao giờ làm mọi người thất vọng.',
      price: 395.25,
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/05/29/07/06/shiba-6292660_1280.jpg',
      isFavorite: true,
    ),
  ];

  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }
}
