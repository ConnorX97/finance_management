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
                  margin: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                              child: IncomeDetail(model: model),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.blueAccent,
            ),
            Text("Education \$ ${model.education}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.purple,
            ),
            Text("Entertainment \$ ${model.entertainment}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.greenAccent,
            ),
            Text("Health & Medical \$ ${model.health}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.blueGrey,
            ),
            Text("Groceries \$ ${model.groceries}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.grey,
            ),
            Text("Transportation \$ ${model.transportation}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.green,
            ),
            Text("Dining \$ ${model.dining}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.orange,
            ),
            Text("Clothing \$ ${model.clothing}"),
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.red,
            ),
            Text("Other \$ ${model.other}"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.blueAccent,
            ),
            Text("Employment \$ ${model.employment}")
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.purple,
            ),
            Text("Investment \$ ${model.investment}")
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.greenAccent,
            ),
            Text("Rental \$ ${model.rental}")
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.blueGrey,
            ),
            Text("Business \$ ${model.business}")
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.grey,
            ),
            Text("Financial support \$ ${model.financialSupport}")
          ],
        ),
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              color: Colors.red,
            ),
            Text("Other \$ ${model.otherInc}")
          ],
        ),
      ],
    );
  }
}
