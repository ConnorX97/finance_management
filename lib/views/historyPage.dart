import 'package:flutter/material.dart';

import '../domain/exporters.dart';

class FullChartView extends StatefulWidget {
  const FullChartView({super.key});
  @override
  State<FullChartView> createState() => _FullChartViewState();
}

class _FullChartViewState extends State<FullChartView> {
  @override
  Widget build(BuildContext context) {
    //final model = Provider.of<MoneyAppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                spreadRadius: 0.1,
                offset: Offset(0, 2))
          ]),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      width: double.infinity,
      //height: 300,
      child: const TransactionList(),
    );
  }
}
