import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'new shoes', price: 44.05, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'new bracelet', price: 55.51, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new shirt', price: 99.66, date: DateTime.now()),
  ];

  void addNewTransaction(txTitle,txPrice){
    final newTx=Transaction(
      title: txTitle,
      price:txPrice,
      id: DateTime.now().toString(),
      date: DateTime.now() );
    
     setState(() {
       _userTransactions.add(newTx);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [NewTransaction(addNewTransaction),TransactionList(_userTransactions)],);
  }
}