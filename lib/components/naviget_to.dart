// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

void navegateTo(context, Widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return Widget;
      },
    ),
  );
}
