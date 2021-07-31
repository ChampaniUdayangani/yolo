import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const String id = 'error_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Page'),
      ),
      body: Container(
        child: Center(
          child: Text('Could not process the request'),
        ),
      ),
    );
  }
}
