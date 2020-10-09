import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNTx;
  final titleControler=TextEditingController();
  final priceControler=TextEditingController();


  void onSubmit(){
   final enteredTitle = titleControler.text;
   final enteredPrice =double.parse(priceControler.text);

  if(enteredTitle.isEmpty || enteredPrice <= 0){
    return;
  }
   addNTx(enteredTitle,
   enteredPrice);
  }
  NewTransaction(this.addNTx);
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleControler,
                    onSubmitted:(_)=> onSubmit,
                    decoration: InputDecoration(labelText: 'title'),
                    
                  ),
                  TextField(
                    controller: priceControler,
                    keyboardType: TextInputType.number,
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