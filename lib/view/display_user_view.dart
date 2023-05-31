import 'package:flutter/material.dart';
import 'package:remote_repo/di/di.dart';
import 'package:remote_repo/repository/user_repository.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({super.key});

  @override
  State<DisplayUserView> createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  var userList = getIt<UserRepository>().getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Display User",
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            const Text("User List"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(userList[index].name),
                  subtitle: Text(userList[index].dob),
                );
              },
            ),
          ],
        ));
  }
}
