import 'exporters.dart';
import 'package:intl/intl.dart';

final class MoneyAppProvider extends ChangeNotifier {
  final TextEditingController comment = TextEditingController();
  final TextEditingController sum = TextEditingController();

  bool isIncomeBool = false;

  List<Map<String, dynamic>> transaction = [];

  void inOutMoneyData(BuildContext context, bool isIncome) {
    if (sum.text.isNotEmpty) {
      int amount = int.parse(sum.text);
      if (amount > 0) {
        String clearDate = DateFormat('dd.MM.yyyy • H:mm').format(DateTime.now());
        final Map<String, dynamic> trans = {
          "isIncome": isIncomeBool,
          "amount": amount,
          "comment": comment.text,
          "date": clearDate,
        };
        transaction.add(trans);
        notifyListeners();
        comment.clear();
        sum.clear();
      }
    } else {
      comment.clear();
      sum.clear();
    }
  }



  void income() {
    if (comment.text.isEmpty) {
      comment.text = "Other";
    }
    if (sum.text.isNotEmpty) {
      isIncomeBool = true;
      totalBalance += int.parse(sum.text);
      received += int.parse(sum.text);
    }
  }

  void outcome() {
    if (comment.text.isEmpty) {
      comment.text = "Other";
    }
    if (sum.text.isNotEmpty) {
      isIncomeBool = false;
      sent += int.parse(sum.text);
      totalBalance -= int.parse(sum.text);
    }
  }

// need optimization
  int totalBalance = 0;
  int received = 0;
  int sent = 0;

  int education = 0;
  int entertainment = 0;
  int health = 0;
  int groceries = 0;
  int transportation = 0;
  int dining = 0;
  int clothing = 0;
  int other = 0;

  int employment = 0;
  int investment = 0;
  int rental = 0;
  int business = 0;
  int financialSupport = 0;
  int otherInc = 0;
}

