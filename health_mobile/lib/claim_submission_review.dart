
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewSummaryWidget extends StatefulWidget {

  @override
  State<ReviewSummaryWidget> createState() => _ReviewSummaryWidget();

}

class _ReviewSummaryWidget extends State<ReviewSummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Review'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
