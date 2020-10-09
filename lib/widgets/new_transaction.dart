import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNTx;
  final titleControler=TextEditingController();
  final priceControler=TextEditingController();
  NewTransaction(this.addNTx);
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleControler,
                    decoration: InputDecoration(labelText: 'title'),
                  ),
                  TextField(
                    controller: priceControler,
                    decoration: InputDecoration(labelText: 'price'),
                  ),
                  FlatButton(
                    child: Text(
                      'Add transaction',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                    onPressed: () {
                     addNTx(titleControler.text,double.parse(priceControler.text));
                    },
                  ),
                ],
              )
              );
  }
}