import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              // shrinks the content inside to fit
              child: Text('\£${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.10,
          ),
          Container(
            width: constraints.maxHeight * 0.2,
            height: constraints.maxHeight * 0.6,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(3)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                )
              ],
            ), // Stack widget allows the widgets to sit on top of each other
          ),
          SizedBox(
            height: constraints.maxHeight * 0.03,
          ),
          Container(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(child: Text(label)),
          )
        ],
      );
    });
  }
}
