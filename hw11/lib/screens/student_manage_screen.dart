import 'package:flutter/material.dart';
import 'package:hw11/wigets/form_wiget.dart';
import '../models/student.dart';

class StudentManageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudenManageState();
  }
}

class StudenManageState extends State<StudentManageScreen> {

  String searchText = "";
  String sortBy = "id";

  List<Student> students = [
    Student(id: 1, name: "Nguyen Van A", age: 20, email: "a@gmail.com"),
    Student(id: 2, name: "Tran Thi B", age: 21, email: "b@gmail.com"),
    Student(id: 3, name: "Le Van C", age: 22, email: "c@gmail.com"),
  ];

  List<Student> filteredStudents = [];

  @override
  void initState() {
    super.initState();
    filteredStudents = List.from(students);
  }

  void searchStudent (String keyword){
    setState(() {
      searchText = keyword;

      filteredStudents = students.where((st){
        return st.name.toLowerCase().contains(keyword.toLowerCase());
      }).toList();

    });
  }

  void sortStudent(String field) {
    setState(() {
      sortBy = field;

      if (field == "name") {
        filteredStudents.sort((a, b) => a.name.compareTo(b.name));
      } else if (field == "age") {
        filteredStudents.sort((a, b) => a.age.compareTo(b.age));
      } else {
        filteredStudents.sort((a, b) => a.id.compareTo(b.id));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => StudentDialog(
                    student: null,
                    onSave: (newStudent) {
                      setState(() {
                        students.add(newStudent);
                        filteredStudents = List.from(students);
                      });
                    },
                  ),
                );
              },
              child: Text("Add Student"),
            ),
          ),
      Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: searchStudent,
            ),
          ),

          SizedBox(width: 10),

          DropdownButton<String>(
            value: sortBy,
            items: [
              DropdownMenuItem(value: "id", child: Text("Sort by ID")),
              DropdownMenuItem(value: "name", child: Text("Sort by Name")),
              DropdownMenuItem(value: "age", child: Text("Sort by Age")),
            ],
            onChanged: (value) {
              if (value != null) {
                sortStudent(value);
              }
            },
          )
        ],
      ),
    ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("ID")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Age")),
                  DataColumn(label: Text("Email")),
                  DataColumn(label: Text("Action")),
                ],
                rows: filteredStudents.map((student) {
                  return DataRow(
                    cells: [
                      DataCell(Text(student.id.toString())),
                      DataCell(Text(student.name)),
                      DataCell(Text(student.age.toString())),
                      DataCell(Text(student.email)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      StudentDialog(student: student
                                          , onSave: (updateStudent){
                                        setState(() {
                                          int index = students.indexWhere((st) => st.id == updateStudent.id);
                                          if (index != -1) { students[index] = updateStudent; }
                                        });
                                          }));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                students.removeWhere((st) => st.id == student.id);
                                filteredStudents = List.from(students);
                              });
                            },
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          )
        ],
      )
    );
  }
}