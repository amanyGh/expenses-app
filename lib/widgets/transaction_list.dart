import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTx;
  TransactionList(this.transactions,this.removeTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
                    trailing: IconButton(icon: 
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor),
                     onPressed: ()=>removeTx(transactions[index].id),
                    )),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
