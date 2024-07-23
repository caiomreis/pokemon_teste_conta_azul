import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0Xfff6f6f6),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow()],
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40,
              height: 16,
            ),
            SizedBox(
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
