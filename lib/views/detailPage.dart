import '../domain/exporters.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MoneyAppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Colors.grey[300],
                unselectedBackgroundColor: Colors.grey[200],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    child: SizedBox(
                      height: 30,
                      width: 170,
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      height: 30,
                      width: 170,
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  height: 600,
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
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                IncomeCircle(model: model),
                                const Text(
                                  "Income",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black26),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: IncomeDetail(model: model)),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ExpenseCircle(model: model),
                                const Text(
                                  "Expense",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black26),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpenseDetail(model: model),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
