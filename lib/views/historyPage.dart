import '../domain/exporters.dart';

class FullChartView extends StatefulWidget {
  const FullChartView({super.key});
  @override
  State<FullChartView> createState() => _FullChartViewState();
}

class _FullChartViewState extends State<FullChartView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Expanded(
        child: Container(
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
          
          width: double.infinity,
          child: const TransactionList(),
        ),
      ),
    );
  }
}
