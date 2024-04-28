



import '../../domain/exporters.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MoneyAppProvider>(context);
    List<Widget> allTrans = List.generate(
      model.transaction.length,
      (index) => HistoryView(
        date: model.transaction[index]["date"],
        price: model.transaction[index]["amount"].toString(),
        comment: model.transaction[index]["comment"],
        isIncome: model.transaction[index]["isIncome"],
      ),
    );
    return ListView(
      children: allTrans.reversed.toList(),
    );
  }
}
