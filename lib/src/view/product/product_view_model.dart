import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductViewModel extends BaseViewModel {
  ProductViewModel({
    required this.cartService,
    required this.product,
  });

  final CartService cartService;
  final Product product;

  int count = 1;
  int colorIndex = 0;

  void onCountChanged(int newCount) {
    count = newCount;
    notifyListeners();
  }

  void onColorIndexChanged(int newColorIndex) {
    colorIndex = newColorIndex;
    notifyListeners();
  }

  void onAddToCartPressed() {
    final CartItem newCartItem = CartItem(
      product: product,
      colorIndex: colorIndex,
      count: count,
      isSelected: true,
    );
    cartService.add(newCartItem);
    Toast.show(S.current.productAdded(product.name));
  }
}
