import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNTx;
  NewTransaction(this.addNTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler=TextEditingController();
  final priceControler=TextEditingController();
  DateTime selectedDate;

  void onSubmit(){
   final enteredTitle = titleControler.text;
   final enteredPrice =double.parse(priceControler.text);
   final enteredDate = selectedDate;

  if(enteredTitle.isEmpty || enteredPrice <= 0 || enteredDate==null){
    return;
  }
   widget.addNTx(
     enteredTitle,
     enteredPrice,
     selectedDate);

     Navigator.pop(context);
  }

  void _presentDatePicker(BuildContext ctx){
    showDatePicker(
      context: ctx, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now()).then((pickedDate){
        if(pickedDate==null){
          return;
        }
        setState(() {
          selectedDate=pickedDate;
        });
      });
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
                  Row(children: [
                    Expanded(
                            child: Text( selectedDate==null? 'no date choosen'
                            :'Picked Date ${DateFormat.yMd().format(selectedDate)}',
                            style: TextStyle(color: Colors.grey),),
                    ),
                    FlatButton(
                      onPressed:()=>_presentDatePicker(context),
                       child: Text('choose a date',style: TextStyle(
                         color: Colors.purpleAccent),))
                  ],),
                  FlatButton(
                    child: Text(
                      'Add transaction',
                    ),
                    
                    textColor: Colors.purple,
                    onPressed: onSubmit
                  ),
                ],
              )
              );
  }
}