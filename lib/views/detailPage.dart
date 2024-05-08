
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
                            16.kH,
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
                            16.kH,
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

