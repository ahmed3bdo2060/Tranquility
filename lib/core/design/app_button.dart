import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.onPressd});
final String text;
final VoidCallback onPressd;
  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onPressd,
      child: Text(text,
        selectionColor: Colors.white,
    ),
    ) ;
  }
}
