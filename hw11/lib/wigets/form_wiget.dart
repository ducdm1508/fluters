
import 'package:flutter/material.dart';
import 'package:hw11/models/student.dart';

class StudentDialog extends StatelessWidget {
  final Student? student;
  final Function(Student) onSave;

  StudentDialog({required this.student, required this.onSave});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (student != null){
      nameController.text =  student!.name;
      ageController.text = student!.age.toString();
      emailController.text = student!.email;
    }
    return AlertDialog(
      title: Text(student == null ? "add student" : "update student"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "name"),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: "age"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "email"),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context)
            , child: Text("cancel")
        ),
        ElevatedButton(
            onPressed: () {
              Student newStudent = Student(id: student?.id ?? DateTime.now().millisecondsSinceEpoch, name: nameController.text, age: int.parse(ageController.text), email: emailController.text);
              onSave(newStudent);
              Navigator.pop(context);
            }, child: Text(student == null ? "add" : "update"))
      ],
    );
  }}