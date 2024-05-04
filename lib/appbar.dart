import 'package:flutter/material.dart';
import 'maikapage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;
  final Function(String?) onSelectPage;

  CustomAppBar({required this.currentPage, required this.onSelectPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('OpenFEMA Data'),
      actions: <Widget>[
        DropdownButton<String>(
          value: currentPage,
          onChanged: onSelectPage,
          items: <String>['Home', 'Other Page']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}