import '../../domain/exporters.dart';

class ExpenseDetail extends StatelessWidget {
  const ExpenseDetail({super.key, required this.model});

  final MoneyAppProvider model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItem(Colors.blueAccent, "Education", model.education),
        _buildItem(Colors.purple, "Entertainment", model.entertainment),
        _buildItem(Colors.greenAccent, "Health & Medical", model.health),
        _buildItem(Colors.blueGrey, "Groceries", model.groceries),
        _buildItem(Colors.grey, "Transportation", model.transportation),
        _buildItem(Colors.green, "Dining", model.dining),
        _buildItem(Colors.orange, "Clothing", model.clothing),
        _buildItem(Colors.red, "Other", model.other),
      ],
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
            Row(
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
          ],
        ),
      ],
    );
  }
}

class ExpenseCircle extends StatelessWidget {
  const ExpenseCircle({
    super.key,
    required this.model,
  });

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
              value: model.education.toDouble(),
              color: Colors.blueAccent,
              title: "Education",
            ),
            PieChartSectionData(
                value: model.entertainment.toDouble(),
                color: Colors.purple,
                title: "Entertainment"),
            PieChartSectionData(
                value: model.health.toDouble(),
                color: Colors.greenAccent,
                title: "Health"),
            PieChartSectionData(
                value: model.groceries.toDouble(),
                color: Colors.blueGrey,
                title: "Groceries"),
            PieChartSectionData(
                value: model.transportation.toDouble(),
                color: Colors.grey,
                title: "Transport"),
            PieChartSectionData(
                value: model.dining.toDouble(),
                color: Colors.green,
                title: "Dining"),
            PieChartSectionData(
                value: model.clothing.toDouble(),
                color: Colors.orange,
                title: "Clothing"),
            PieChartSectionData(
                value: model.other.toDouble(),
                color: Colors.red,
                title: "Others"),
          ],
        ),
      ),
    );
  }
}