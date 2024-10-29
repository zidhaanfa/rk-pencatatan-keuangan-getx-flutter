import 'package:flutter/material.dart';

import '../config/base_data.dart';

class CustomWidgetMaxWidth extends StatelessWidget {
  CustomWidgetMaxWidth({
    Key? key,
    required this.child,
    this.maxWidth,
  }) : super(key: key);

  final Widget child;
  final double? maxWidth;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? ResponsiveGetX.maxWidth,
      ),
      child: child,
    );
  }
}
