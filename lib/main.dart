import 'package:flutter/material.dart';
import 'package:remote_repo/di/di.dart';
import 'package:remote_repo/view/add_user_view.dart';
import 'package:remote_repo/view/display_user_view.dart';

void main() {
  initModule();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AddUserView(),
        '/displayUser': (context) => const DisplayUserView(),
      },
    ),
  );
}
