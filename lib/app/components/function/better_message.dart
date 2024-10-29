import 'package:flutter/material.dart';

class BetterShowMessage {
  BuildContext context;

  String? _title;
  Widget? _content;
  Widget Function(BuildContext)? _builder;
  List<Widget>? _buttons;
  void Function()? _onDefaultOK;

  BetterShowMessage(this.context);

  BetterShowMessage setTitle(String title) {
    _title = title;

    return this;
  }

  BetterShowMessage setContent(Widget content) {
    _content = content;

    return this;
  }

  BetterShowMessage setButtons(List<Widget> buttons) {
    _buttons = buttons;

    return this;
  }

  BetterShowMessage setOnDefaultOK(void Function() onDefaultOK) {
    _onDefaultOK = onDefaultOK;

    return this;
  }

  BetterShowMessage useBuilder(Widget Function(BuildContext context) builder) {
    _builder = builder;

    return this;
  }

  void showMessage() {
    _buttons ??= [
      TextButton(
          onPressed: _onDefaultOK ??
              () {
                Navigator.pop(context);
              },
          child: const Text('OK')),
    ];

    showDialog(
        context: context,
        builder: _builder ??
            (ctx) {
              return AlertDialog(
                title: Text(_title ?? 'No Title'),
                content: _content ?? const Text('No Content'),
                actions: _buttons,
              );
            });
  }
}
