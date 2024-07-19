import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/view/base_view.dart';
import 'package:house_of_tomorrow/src/view/shopping/shopping_view_model.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_card_grid.dart';
import 'package:house_of_tomorrow/src/view/shopping/widget/product_empty.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/button/button.dart';
import 'package:house_of_tomorrow/theme/component/cart_button.dart';
import 'package:house_of_tomorrow/theme/component/input_field.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  final ShoppingViewModel shoppingViewModel = ShoppingViewModel();
  @override
  void initState() {
    super.initState();
    shoppingViewModel.searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: shoppingViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.shopping),
          actions: [
            Button(
              icon: 'option',
              type: ButtonType.flat,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SettingBottomSheet();
                  },
                );
              },
            ),
            const CartButton(),
          ],
        ),
        body: Column(
          children: [
            //검색창
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InputField(
                      controller: viewModel.textEditingController,
                      onClear: viewModel.searchProductList,
                      onSubmitted: (text) => viewModel.searchProductList(),
                      hint: S.current.searchProduct,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Button(
                    onPressed: viewModel.searchProductList,
                    icon: 'search',
                  )
                ],
              ),
            ),
            Expanded(
              child: viewModel.productList.isEmpty
                  ? const ProductEmpty()
                  : ProductCardGrid(viewModel.productList),
            ),
          ],
        ),
      ),
    );
  }
}
