import '../domain/exporters.dart';

class FullChartView extends StatefulWidget {
  FullChartView({super.key});
  @override
  State<FullChartView> createState() => _FullChartViewState();
}

class _FullChartViewState extends State<FullChartView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MoneyAppProvider>(context);
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}

// need to be optimized
