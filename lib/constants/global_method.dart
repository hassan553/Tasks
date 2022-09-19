import 'package:flutter/material.dart';

navigationTo({context, screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}

navigationAndEnd({context, screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}

pop({required context}) {
  Navigator.pop(context);
}

showSnackBar({message, color, context}) {
  SnackBar snackBar = SnackBar(
    content: Text(message.toString()),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    padding: const EdgeInsets.all(
      10,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
