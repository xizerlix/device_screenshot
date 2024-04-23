import 'package:flutter/material.dart';

class ExampleButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const ExampleButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: Colors.purpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
