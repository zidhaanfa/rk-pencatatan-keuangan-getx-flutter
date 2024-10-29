import 'package:flutter/material.dart';

import '../config/config.dart';
import 'Custom_qty.dart';
import 'Custom_text.dart';

class CustomCard4Cart extends StatelessWidget {
  CustomCard4Cart({
    Key? key,
    required this.qty,
    required this.name,
    required this.price,
    required this.variant,
    required this.imageUrl,
    this.onPressedPlus,
    this.onPressedMin,
    this.onPressedDelete,
    this.withQty,
  }) : super(key: key);

  final int qty;
  final String name;
  final String price;
  final String variant;
  final String imageUrl;
  final Function()? onPressedPlus;
  final Function()? onPressedMin;
  final Function()? onPressedDelete;
  final bool? withQty;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: theme.hoverColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: theme.buttonTheme.colorScheme!.primary,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        fontType: FontType.bodyMedium,
                      ),
                      CustomText(
                        text: price,
                        fontType: FontType.bodySmall,
                        colorText: theme.buttonTheme.colorScheme!.primary,
                        weight: FontWeight.bold,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.hoverColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomText(
                          text: variant,
                          fontType: FontType.bodySmall,
                        ),
                      ),
                      withQty == null || withQty == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomQty(
                                  qty: qty,
                                  onPressedMin: onPressedMin,
                                  onPressedPlus: onPressedPlus,
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
