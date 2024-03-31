import 'package:flutter/material.dart';

class MovieErrorWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const MovieErrorWidget({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Error Fetching Movie List'),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColorLight),
                foregroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)),
            onPressed: onPressed,
            child: const Text('Try Again!'),
          )
        ],
      ),
    );
  }
}
