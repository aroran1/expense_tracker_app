import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionalList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionalList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // to get the scrolling working wrap Column inside Container with fixed height and then inside SingleChildScrollView
    // or you can use ListView instead of SingleChildScrollView and Column
    // ListView(children: []) = smililar to SingleChildScrollView renders the full list at once and maintains them, Not suitable for large lists
    // ListView.builder: []) = not like SingleChildScrollView renders only visible list and renders / build only whats visible (built in lazy load machaism), suitable for large lists
    // ListView.builder: []) comes with itemBuider: (builderContext (returns the item), index as int) and itemCount: XYZ.length so it can count upfornt the item that'll be visible
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '£' + transactions[index].amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        itemExtent: 70,
      ),
    );
  }
}
