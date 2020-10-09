import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
 final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.purpleAccent,
                            width: 1,
                          )),
                          child: Text(
                            '\$ ${tx.price}',
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
   );
  }
}