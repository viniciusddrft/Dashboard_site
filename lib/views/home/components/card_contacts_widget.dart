import 'package:flutter/material.dart';

class CardContactsWidget extends StatelessWidget {
  final String? datetime;
  final String? email;
  final String? find;
  final String? name;
  final String? phone;
  final String? subject;
  const CardContactsWidget(
      {Key? key,
      required this.datetime,
      required this.email,
      required this.find,
      required this.name,
      required this.phone,
      required this.subject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade200,
      child: Column(
        children: [
          Text(datetime ?? 'null'),
          Text(email ?? 'null'),
          Text(find ?? 'null'),
          Text(name ?? 'null'),
          Text(phone ?? 'null'),
          Text(subject ?? 'null')
        ],
      ),
    );
  }
}
