import 'dart:math';

import 'package:flutter/material.dart';
import './transaction_form.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
    ),
    Transaction(
      id: 't3',
      title: 'Camisa',
      value: 44.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Calça',
      value: 52.3,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Celular',
      value: 2434.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Placa de Video',
      value: 4543.4,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
