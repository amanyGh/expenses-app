import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Trnsaction> transactions = [
    Trnsaction(id: 't1', title: 'new shoes', price: 44.05, date: DateTime.now()),
    Trnsaction(
        id: 't1', title: 'new bracelet', price: 55.51, date: DateTime.now()),
    Trnsaction(id: 't2', title: 'new shirt', price: 99.66, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('expenses app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child:
                  Card(color: Colors.blue, elevation: 5,
                   child: Text('chart')),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,horizontal: 10
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purpleAccent,
                            width: 1,
                          )
                        ),
                        child: Text('\$ ${tx.price}',
                        style:TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold) ,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(tx.date.toString(),
                          style: TextStyle(color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
