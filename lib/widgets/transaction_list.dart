import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionalList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionalList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // to get the scrolling working wrap Column inside Container with fixed height and then inside SingleChildScrollView
    // or you can use ListView instead of SingleChildScrollView and Column
    // ListView(children: []) = smililar to SingleChildScrollView renders the full list at once and maintains them, Not suitable for large lists
    // ListView.builder: []) = not like SingleChildScrollView renders only visible list and renders / build only whats visible (built in lazy load machaism), suitable for large lists
    // ListView.builder: []) comes with itemBuider: (builderContext (returns the item), index as int) and itemCount: XYZ.length so it can count upfornt the item that'll be visible
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.bodyText1,
                // style: TextStyle(backgroundColor: Colors.black87)
              ),
              SizedBox(height: 40),
              Container(
                height: 140,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                // margin: EdgeInsets.symmetric(
                //   vertical: 10,
                //   horizontal: 10,
                // ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  // visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: FittedBox(
                        child: Text(
                          '\£${transactions[index].amount.toStringAsFixed(2)}',
                          textScaleFactor: 0.8,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title.toString(),
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      transactions[index].date,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.purple,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '£' + transactions[index].amount.toStringAsFixed(2),
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Colors.purple,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactions[index].title.toString(),
              //             style: Theme.of(context).textTheme.headline3,
              //             // style: TextStyle(
              //             //   fontWeight: FontWeight.bold,
              //             //   fontSize: 16,
              //             //   color: Colors.black,
              //             // ),
              //           ),
              //           Text(
              //             DateFormat()
              //                 .add_yMMMd()
              //                 .format(transactions[index].date),
              //             style: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
            },
            itemCount: transactions.length,
            itemExtent: 70,
          );
  }
}
