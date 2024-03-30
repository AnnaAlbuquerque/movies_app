import 'package:flutter/material.dart';

class TitleRowBuild extends StatelessWidget {
  final bool showMoreButton;
  final String title;
  final VoidCallback? onPressed;
  const TitleRowBuild({
    required this.title,
    this.showMoreButton = true,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          if (showMoreButton) ...[
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColorLight),
              onPressed: onPressed,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'More',
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  )
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
