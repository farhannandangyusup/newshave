import 'package:flutter/material.dart';

class AnimatedDotsIndicator extends StatelessWidget {
  final int totalDots;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  const AnimatedDotsIndicator({
    Key? key,
    required this.totalDots,
    required this.currentIndex,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double dotSize = 12;
    const double activeDotWidth = 24;
    const double spacing = 8;

    return SizedBox(
      height: dotSize,
      width: (dotSize * totalDots) +
          (spacing * (totalDots - 1)) +
          (activeDotWidth - dotSize),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(totalDots, (index) {
              return Container(
                width: dotSize,
                height: dotSize,
                margin: EdgeInsets.only(
                    right: index == totalDots - 1 ? 0 : spacing),
                decoration: BoxDecoration(
                  color: inactiveColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(dotSize / 2),
                ),
              );
            }),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            left: (dotSize + spacing) * currentIndex,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: activeDotWidth,
              height: dotSize,
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(dotSize / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
