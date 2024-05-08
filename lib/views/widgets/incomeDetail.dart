

import '../../domain/exporters.dart';

class IncomeCircle extends StatelessWidget {
  const IncomeCircle({super.key, required this.model});
  final MoneyAppProvider model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: PieChart(
        swapAnimationDuration: const Duration(milliseconds: 750),
        PieChartData(
          sections: [
            PieChartSectionData(
              value: model.employment.toDouble(),
              color: Colors.blueAccent,
              title: "Employment",
            ),
            PieChartSectionData(
                value: model.investment.toDouble(),
                color: Colors.purple,
                title: "Investment"),
            PieChartSectionData(
                value: model.rental.toDouble(),
                color: Colors.greenAccent,
                title: "Rental"),
            PieChartSectionData(
                value: model.business.toDouble(),
                color: Colors.blueGrey,
                title: "Business"),
            PieChartSectionData(
                value: model.financialSupport.toDouble(),
                color: Colors.grey,
                title: "Financial support"),
            PieChartSectionData(
                value: model.otherInc.toDouble(),
                color: Colors.red,
                title: "Other"),
          ],
        ),
      ),
    );
  }
}

class IncomeDetail extends StatelessWidget {
  const IncomeDetail({super.key, required this.model});

  final MoneyAppProvider model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem(Colors.blueAccent, "Employment", model.employment),
          _buildItem(Colors.purple, "Investment", model.investment),
          _buildItem(Colors.greenAccent, "Rental", model.rental),
          _buildItem(Colors.blueGrey, "Business", model.business),
          _buildItem(Colors.grey, "Financial support", model.financialSupport),
          _buildItem(Colors.red, "Other", model.otherInc),
        ],
      ),
    );
  }

  Widget _buildItem(Color color, String title, int value) {
    return Column(
      children: [
        8.kH,
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color,
              ),
              height: 25,
              width: 50,
            ),
            12.kW,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                  ),
                  Text(
                    "   -  \$$value",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
