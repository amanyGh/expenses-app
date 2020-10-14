import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/chart_bar.dart';
import 'models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions);
  List<Map<String, Object>> get groubedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].price;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'price': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpendding {
    return groubedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groubedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groubedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
                        child: ChartBar(
                  data['Day'],
                  maxSpendding == 0.0
                      ? 0.0
                      : (data['price'] as double) / maxSpendding,
                  data['price']),
            );
          }).toList(),
        ),
      ),
    );
  }
}
