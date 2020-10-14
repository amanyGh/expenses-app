import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('no transactions yet'),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/waiting.png',
                  width: 100,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  elevation: 5,
                    child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text('${transactions[index].price}')),
                      ),
                    ),
                    title: Text('${transactions[index].title}'),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
