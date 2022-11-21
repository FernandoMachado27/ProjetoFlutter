import 'package:flutter/material.dart';

class Insurance extends StatelessWidget { // classe responsavel por selecionar o nivel do seguro
  final int insuranceLevel;

  const Insurance({
    required this.insuranceLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (insuranceLevel >= 1) ? Colors.orange : Colors.orange[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (insuranceLevel >= 2) ? Colors.orange : Colors.orange[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (insuranceLevel >= 3) ? Colors.orange : Colors.orange[100],
        ),
      ],
    );
  }
}
