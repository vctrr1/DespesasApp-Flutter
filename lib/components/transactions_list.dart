import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList(this.transactions, {Key? key}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nothing Here',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/lupa.png'),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 29,
                    child: FittedBox(
                      child: Text("R\$${tr.value}"),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: const Icon(Icons.delete),
                );
              },
            ),
    );
  }
}





/*
codigo antigo usando cards para exibir cada transação

                Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 19,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "R\$ ${tr.value.toStringAsFixed(2)}", // isso é uma imterpolação, nao precisaria do toString
                          //pq quando usa ${} ja esta no contexto de String
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: Theme.of(context).textTheme.headline6,
                            // style: TextStyle(
                            //   fontSize: 18,
                            //   fontWeight: FontWeight.bold,
                            //   color: Colors.black,
                            // ),
                          ),
                          Text(
                            DateFormat("d MMM y").format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
 */
