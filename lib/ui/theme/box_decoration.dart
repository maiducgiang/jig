import 'package:flutter/material.dart';

BoxDecoration get primaryBoxDecoration {
  return const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 2),
        blurRadius: 4.0,
      ),
    ],
  );
}

BoxShadow get primaryBoxShadow {
  return BoxShadow(
      color: Colors.grey.withOpacity(0.25),
      spreadRadius: 1,
      blurRadius: 2,
      offset: const Offset(1, 2));
  // return const BoxShadow(
  //   color: Colors.grey,
  //   offset: Offset(0, 2),
  //   blurRadius: 4.0,
  // );
}
