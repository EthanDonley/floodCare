import 'package:flutter/material.dart';
import 'appbar.dart';

class MaikaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(currentPage: 'Other Page', onSelectPage: (page) {
        // Navigation logic specific to MaikaPage
        if (page == 'Home') {
          Navigator.pop(context);
        }
      }),
      body: Center(
        child: Text("This is a customizable page!"),
      ),
    );
  }
}