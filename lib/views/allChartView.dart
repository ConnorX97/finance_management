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
    return ListView.builder(
      itemBuilder: (context, index) => Center(child: const Text("data")),
      itemCount: 50,
    );
  }
}

// need to be optimized
