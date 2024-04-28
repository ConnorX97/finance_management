import 'package:finance_management/domain/exporters.dart';

class HistoryView extends StatelessWidget {
  final String price;
  final String comment;
  final bool isIncome;
  final String date;
  const HistoryView({
    super.key,
    required this.price,
    required this.comment,
    required this.isIncome,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String clearComment = comment[0].toUpperCase() + comment.substring(1);
    ;
    return ListTile(
      trailing: isIncome
          ? Text(
              "+\$$price",
              style: const TextStyle(color: Colors.green, fontSize: 16),
            )
          : Text("-\$$price",
              style: const TextStyle(color: Colors.red, fontSize: 16)),
      leading: isIncome
          ? const Icon(
              Icons.arrow_downward,
              color: Colors.green,
            )
          : const Icon(
              Icons.arrow_upward,
              color: Colors.red,
            ),
      title: Text(
        clearComment,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(date),
    );
  }
}
