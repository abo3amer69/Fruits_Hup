import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String messae) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(messae),
    ),
  );
}
