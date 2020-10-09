import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:expenses_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTx(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(addNewTransaction));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expenses app'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed:()=> startAddNewTx(context))],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, elevation: 5, child: Text('chart')),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed:()=> startAddNewTx(context),
      ),
    );
  }
}
