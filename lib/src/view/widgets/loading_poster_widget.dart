import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPosterWidget extends StatefulWidget {
  const LoadingPosterWidget({super.key});

  @override
  State<LoadingPosterWidget> createState() => _LoadingPosterWidgetState();
}

class _LoadingPosterWidgetState extends State<LoadingPosterWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).primaryColorLight.withOpacity(0.5),
      highlightColor: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
