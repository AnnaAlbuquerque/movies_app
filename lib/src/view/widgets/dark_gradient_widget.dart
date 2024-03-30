import 'package:flutter/material.dart';

class DarkGradientWidget extends StatelessWidget {
  const DarkGradientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColorDark.withOpacity(0),
            Theme.of(context).primaryColorDark.withOpacity(1),
          ],
        ),
      ),
    );
  }
}
