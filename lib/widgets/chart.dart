import 'package:expense_tracker_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

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
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      });

      // get day label with DateFormat.E(weekDay)
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            // return Text('${data['day']}: ${data['amount']}');
            return Flexible(
              // you can use Flex to distribute the space between the child widgets
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
          // <Widget>[
          //   Column(),
          // ],
        ),
      ),
    );
  }
}
