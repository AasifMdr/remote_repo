import 'package:flutter/material.dart';
import 'package:remote_repo/di/di.dart';
import 'package:remote_repo/repository/user_repository.dart';

import '../model/user.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final birthTimeController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create profile"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Id',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );

                if (selectedDate != null) {
                  setState(() {
                    dobController.text = selectedDate!.toString().split(' ')[0];
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dobController.text.isEmpty
                          ? 'Select a date'
                          : dobController.text,
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () async {
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                );

                if (selectedTime != null) {
                  setState(() {
                    birthTimeController.text = selectedTime!.format(context);
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Birth Time',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      birthTimeController.text.isEmpty
                          ? 'Select a time'
                          : birthTimeController.text,
                    ),
                    const Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  id: int.parse(idController.text.trim()),
                  name: nameController.text.trim(),
                  dob: dobController.text.trim(),
                  birthTime: birthTimeController.text.trim(),
                );
                getIt<UserRepository>().addUser(user);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.teal,
                ),
              ),
              child: const Text('Add User'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/displayUser');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.teal,
                ),
              ),
              child: const Text('Display User'),
            ),
          ],
        ),
      ),
    );
  }
}
