import 'package:despesas_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentsTransactions, {Key? key}) : super(key: key);

  final List<Transaction> recentsTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (var i = 0; i < recentsTransactions.length; i++) {
          bool sameDay = recentsTransactions[i].date.day == weekDay.day;
          bool sameMonth = recentsTransactions[i].date.month == weekDay.month;
          bool sameYear = recentsTransactions[i].date.year == weekDay.year;

          if (sameDay && sameMonth && sameYear) {
            totalSum += recentsTransactions[i].value;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay)[0],
          'value': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum += (item['value'] as double);
      //item ta assim pq éle é um objetc e precisamos de um double
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(010),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'].toString(),
                percentage: _weekTotalValue == 0
                    ? 0
                    : (e['value'] as double) / _weekTotalValue,
                value: (e['value'] as double),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
