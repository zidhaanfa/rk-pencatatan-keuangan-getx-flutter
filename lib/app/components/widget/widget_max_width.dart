import 'package:flutter/material.dart';

import '../config/base_data.dart';

class WidgetMaxWidth extends StatelessWidget {
  WidgetMaxWidth({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: ResponsiveGetX.maxWidth,
      ),
      child: child,
    );
  }
}
