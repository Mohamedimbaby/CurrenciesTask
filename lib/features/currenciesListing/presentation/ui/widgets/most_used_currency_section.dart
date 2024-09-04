import 'package:flutter/material.dart';

class MostUsedCurrencySection extends StatelessWidget {
  const MostUsedCurrencySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      child: Card(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
