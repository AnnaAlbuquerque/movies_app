import 'package:flutter/material.dart';

class MovieDetailWidget extends StatelessWidget {
  final String info;
  final Widget? icon;
  const MovieDetailWidget({
    required this.info,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          const SizedBox(width: 2),
          Text(info),
        ],
      ),
    );
  }
}
