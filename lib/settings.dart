import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Add an Address"),
          subtitle: Text("IN Case We're missing Something")
        ),
        ListTile(
          title: Text("Your Given Addresses"),
          subtitle: Text("List of all addresses you have given"),
        )
      ],
    );
  }
}