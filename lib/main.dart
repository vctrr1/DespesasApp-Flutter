import 'package:despesas_app/models/transaction.dart';
import 'package:flutter/material.dart';
import './components/transactions_list.dart';
import './components/transaction_form.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tenis Novo',
      value: 213.2,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Bola de Basquete',
      value: 54.3,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Despesas")),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            elevation: 5,
            child: Text("Testando"),
          ),
          TransactionsList(_transactions),
          TransactionForm(),
        ],
      ),
    );
  }
}
