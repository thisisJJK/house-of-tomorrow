import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/service/cart_service.dart';
import 'package:house_of_tomorrow/src/view/base_view_model.dart';
import 'package:house_of_tomorrow/theme/component/toast/toast.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class CartViewModel extends BaseViewModel {
  CartViewModel({
    required this.cartService,
  }) {
    cartService.addListener(notifyListeners);
  }

  final CartService cartService;

  @override
  void dispose() {
    cartService.removeListener(notifyListeners);
    super.dispose();
  }

  List<CartItem> get cartItemList => cartService.cartItemList;
  List<CartItem> get selectedCartItemList => cartService.selectedCartItemList;

  String get totalPrice {
    return selectedCartItemList.isEmpty
        ? '0'
        : IntlHelper.currency(
            symbol: cartService.selectedCartItemList.first.product.priceUnit,
            number: cartService.selectedCartItemList.fold(0, (prev, curr) {
              return prev + curr.count * curr.product.price;
            }),
          );
  }

  void onDeletePressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.deleteDialogSuccessToast);
  }

  void onCheckoutPressed() {
    cartService.delete(cartService.selectedCartItemList);
    Toast.show(S.current.checkoutDialogSuccessToast);
  }

  void onCartItemPressed(int index) {
    final cartItem = cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        isSelected: !cartItem.isSelected,
      ),
    );
  }

  void onCountChanged(int index, int count) {
    final cartItem = cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        count: count,
      ),
    );
  }
}
