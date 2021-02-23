import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;
  final double size;
  final Color color;
  final int marginFactor;

  const StarDisplayWidget({
    Key key,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.color = Colors.orange,
    this.size = 20,
    this.marginFactor = 5,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(5, (index) {
        return Container(
          width: size - size / marginFactor,
          height: size,
          child: Icon(
            index < value
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
            color: color,
            size: size,
          ),
        );
      }),
    );
  }
}
