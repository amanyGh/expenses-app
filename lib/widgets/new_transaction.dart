import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNTx;
  NewTransaction(this.addNTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler=TextEditingController();

  final priceControler=TextEditingController();

  void onSubmit(){
   final enteredTitle = titleControler.text;
   final enteredPrice =double.parse(priceControler.text);

  if(enteredTitle.isEmpty || enteredPrice <= 0){
    return;
  }
   widget.addNTx(
     enteredTitle,
     enteredPrice);

     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleControler,
                    onSubmitted:(_)=> onSubmit(),
                    decoration: InputDecoration(labelText: 'title'),
                    
                  ),
                  TextField(
                    controller: priceControler,
                    keyboardType: TextInputType.number,
                    onSubmitted:(_)=> onSubmit(),
                    decoration: InputDecoration(labelText: 'price'),
                  ),
                  FlatButton(
                    child: Text(
                      'Add transaction',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                    onPressed: onSubmit
                  ),
                ],
              )
              );
  }
}