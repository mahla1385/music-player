import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String pin = '';
  String amount = '';

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('successful payment! '),
          content: Text('amount of  $amount from card $cardNumber was paid.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ok '),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('payment page')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'credit card number'),
                keyboardType: TextInputType.number,
                maxLength: 16,
                validator: (value) =>
                value!.length != 16 ? 'your carts number must have 16 integers ' : null,
                onSaved: (value) => cardNumber = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'password ( 4 digits)'),
                obscureText: true,
                maxLength: 4,
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.length != 4 ? 'password must be 4 digits ' : null,
                onSaved: (value) => pin = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'payment amount (Tooman)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'pleas enter the amount ' : null,
                onSaved: (value) => amount = value!,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitPayment,
                child: const Text('payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}