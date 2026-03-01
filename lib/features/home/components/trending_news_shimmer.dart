import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 12),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(width: 260, height: 140, color: Colors.white),
          ),
        );
      },
    );
  }
}
