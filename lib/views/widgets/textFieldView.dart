// ignore_for_file: must_be_immutable
import '../../domain/exporters.dart';

class IncomeAndOutcomeView extends StatefulWidget {
  IncomeAndOutcomeView({super.key, this.isIncome = true});

  bool isIncome;

  @override
  State<IncomeAndOutcomeView> createState() => _IncomeAndOutcomeViewState();
}

class _IncomeAndOutcomeViewState extends State<IncomeAndOutcomeView> {
  String _categ = "Other";

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MoneyAppProvider>(context);

    return AlertDialog(
      title: widget.isIncome ? Text("Income") : Text("Expense"),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: model.sum,
              decoration: const InputDecoration(hintText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            widget.isIncome ? incomeCategory() : expenceCategory(),
            TextField(
              controller: model.comment,
              decoration: const InputDecoration(hintText: "Comment"),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.isIncome
                ? ElevatedButton(
                    onPressed: () {
                      incomeCategorySelect(model, _categ);
                      model.income();
                      model.inOutMoneyData(context, true);
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_downward))
                : ElevatedButton(
                    onPressed: () {
                      expenseCategorySelect(model, _categ);
                      model.outcome();
                      model.inOutMoneyData(context, false);
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_upward_outlined)),
          ],
        ),
      ],
    );
  }

  DropdownButton<String> expenceCategory() {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem(
          value: "Other",
          child: Text("Other"),
        ),
        DropdownMenuItem(
          value: "Education",
          child: Text("Education"),
        ),
        DropdownMenuItem(
          value: "Entertaiment",
          child: Text("Entertaiment"),
        ),
        DropdownMenuItem(
          value: "Health & Mediacal",
          child: Text("Health & Mediacal"),
        ),
        DropdownMenuItem(
          value: "Groceries",
          child: Text("Groceries"),
        ),
        DropdownMenuItem(
          value: "Transportation",
          child: Text("Transportation"),
        ),
        DropdownMenuItem(
          value: "Dining",
          child: Text("Dining"),
        ),
        DropdownMenuItem(
          value: "Clothing",
          child: Text("Clothing"),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _categ = value!;
        });
      },
      value: _categ,
    );
  }

  DropdownButton<String> incomeCategory() {
    return DropdownButton<String>(
      items: const [
        DropdownMenuItem(
          value: "Other",
          child: Text("Other"),
        ),
        DropdownMenuItem(
          value: "Employment",
          child: Text("Employment"),
        ),
        DropdownMenuItem(
          value: "Investment",
          child: Text("Investment"),
        ),
        DropdownMenuItem(
          value: "Rental",
          child: Text("Rental"),
        ),
        DropdownMenuItem(
          value: "Business",
          child: Text("Business"),
        ),
        DropdownMenuItem(
          value: "Financial support",
          child: Text("Financial support"),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _categ = value!;
        });
      },
      value: _categ,
    );
  }
}

void expenseCategorySelect(final model, final categ) {
  if (categ == "Education") {
    model.education += int.parse(model.sum.text);
  } else if (categ == "Entertaiment") {
    model.entertainment += int.parse(model.sum.text);
  } else if (categ == "Health & Mediacal") {
    model.health += int.parse(model.sum.text);
  } else if (categ == "Groceries") {
    model.groceries += int.parse(model.sum.text);
  } else if (categ == "Transportation") {
    model.transportation += int.parse(model.sum.text);
    ();
  } else if (categ == "Dining") {
    model.dining += int.parse(model.sum.text);
  } else if (categ == "Clothing") {
    model.clothing += int.parse(model.sum.text);
  } else if (categ == "Other") {
    model.other += int.parse(model.sum.text);
  }
}

void incomeCategorySelect(final model, final categ) {
  if (categ == "Employment") {
    model.employment += int.parse(model.sum.text);
  } else if (categ == "Investment") {
    model.investment += int.parse(model.sum.text);
  } else if (categ == "Rental") {
    model.rental += int.parse(model.sum.text);
  } else if (categ == "Business") {
    model.business += int.parse(model.sum.text);
  } else if (categ == "Financial support") {
    model.financialSupport += int.parse(model.sum.text);
  } else if (categ == "Other") {
    model.otherInc += int.parse(model.sum.text);
  }
}