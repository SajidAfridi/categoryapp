import 'package:flutter/material.dart';

class ErrorHandling extends StatefulWidget {
  const ErrorHandling({Key? key, required this.errorHandling}) : super(key: key);
  final String errorHandling;
  @override
  _ErrorHandlingState createState() => _ErrorHandlingState();
}

class _ErrorHandlingState extends State<ErrorHandling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Error")
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("${widget.errorHandling}"),
          )
        ],
      ),
    );
  }
}