import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // added a getter
  List<Map<String, Object>> get groupedTransactionValues {
    // generate a list for last 7 days only
    return List.generate(7, (index) {
      // starting from today going back all the way to the 7th day by subtracting index from today
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.00;
      // get total transaction for each day
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print({
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      });

      // get day label with DateFormat.E(weekDay)
      return {
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Card(
        child: Row(
          children: <Widget>[
            Column(),
          ],
        ),
      ),
    );
  }
}
