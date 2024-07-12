import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/rating.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.current.description,
                  style: context.typo.headline4.copyWith(
                    fontWeight: context.typo.semiBold,
                  ),
                ),
              ),
              Rating(rating: product.rating),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            product.desc.toString(),
            style: context.typo.headline6.copyWith(
              color: context.color.subtext,
            ),
          ),
        ],
      ),
    );
  }
}
