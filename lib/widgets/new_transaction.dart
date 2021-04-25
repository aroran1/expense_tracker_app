import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function handleAddTransaction;

  NewTransaction(this.handleAddTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // widget.<constructorMethodName> gives access to the method pass in the related Class
    widget.handleAddTransaction(
      enteredTitle,
      enteredAmount,
    );

    // closes the top most layer
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              // onPressed: () {
              //   print(titleController.text);
              //   print(amountController.text);
              //   handleAddTransaction(
              //     titleController.text,
              //     double.parse(amountController.text),
              //   );
              // },
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
