import 'package:flutter/material.dart';

class RowBill extends StatelessWidget {
  final int number;
  final String paymentWay;
  const RowBill({super.key, required this.number, required this.paymentWay});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$number", style: const TextStyle(fontSize: 20)),
        const Text("Item", style: TextStyle(fontSize: 20)),
        Text(paymentWay, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
