import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _valueController = TextEditingController();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        setState(() {
          _selectedDate = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(labelText: "Valor (R\$)"),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? ("Nenhuma Data Selecionada")
                        : "Data Selecionada: ${DateFormat('dd/M/y').format(_selectedDate)}",
                  ),
                ),
                TextButton(
                  onPressed: _showDataPicker,
                  child: const Text("Selecionar Data"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).textTheme.button?.color,
                ),
                onPressed: () {
                  _submitForm();
                },
                child: const Text(
                  "Adicionar Transação",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
