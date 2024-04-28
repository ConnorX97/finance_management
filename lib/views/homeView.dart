import '../domain/exporters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> views = <Widget>[HomeView(), FullChartView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: views[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Main"),
              selectedColor: Colors.purple),
          SalomonBottomBarItem(
              icon: const Icon(Icons.list),
              title: const Text("Details"),
              selectedColor: Colors.green),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MoneyAppProvider>(context);
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MainCardWidget(
                received: model.received,
                sent: model.sent,
                totalBalance: model.totalBalance,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => IncomeAndOutcomeView(
                        isIncome: true,
                      ),
                    );
                  },
                  child: const Text("Income"),
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => IncomeAndOutcomeView(
                        isIncome: false,
                      ),
                    );
                  },
                  child: const Text("Expense"),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 12),
                  child: Text(
                    "Transactions",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 300,
              child: const TransactionList(),
            ),
          ],
        ),
      ),
    );
  }
}
