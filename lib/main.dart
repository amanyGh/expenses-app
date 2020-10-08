import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Trnsaction> transactions=[
    Trnsaction(id: 't1',title: 'new shoes',price: 44,date: DateTime.now()),
    Trnsaction(id: 't1',title: 'new bracelet',price: 55.5,date: DateTime.now()),
    Trnsaction(id: 't2',title: 'new shirt',price: 99.5,date: DateTime.now()),

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
          child: Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('chart')),
             ),
        Column(children: transactions.map((tx){
          return Card(child:Text(tx.title));
        }).toList(),)
      ],)
    );
  }


}
