import 'package:flutter/material.dart';

class CustomQty extends StatelessWidget {
  CustomQty({
    Key? key,
    this.width,
    this.height,
    this.colorCard,
    this.colorWidget,
    this.name,
    this.onPressedMin,
    this.onPressedPlus,
    required this.qty,
  }) : super(key: key);

  double? width;
  double? height;
  Color? colorCard;
  Color? colorWidget;
  String? name;
  Function()? onPressedMin;
  Function()? onPressedPlus;
  int qty;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height ?? 40,
      width: width ?? 110,
      decoration: BoxDecoration(
        color: colorCard ?? theme.buttonTheme.colorScheme!.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              if (qty > 1) {
                qty--;
                // onPressedMin!();
              } else {
                qty = 1;
              }
            },
            icon: Icon(
              Icons.remove,
              color: colorWidget ?? theme.buttonTheme.colorScheme!.onPrimary,
            ),
          ),
          Text(
            name ?? qty.toString(),
            style: TextStyle(
              color: colorWidget ?? theme.buttonTheme.colorScheme!.onPrimary,
            ),
          ),
          IconButton(
            onPressed: () {
              qty++;
              // onPressedPlus!();
            },
            icon: Icon(
              Icons.add,
              color: colorWidget ?? theme.buttonTheme.colorScheme!.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
