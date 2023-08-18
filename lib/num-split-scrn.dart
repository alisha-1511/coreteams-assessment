import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberSplitterScreen extends StatefulWidget {
  @override
  _NumberSplitterScreenState createState() => _NumberSplitterScreenState();
}

class _NumberSplitterScreenState extends State<NumberSplitterScreen> {
  String number = '';
  String inputList = '';
  List<int> evenList = [];
  List<int> oddList = [];
  String invalidInput = '';

  void checkNumber() {
    if (number.isNotEmpty) {
      if (int.tryParse(number) != null) {
        int parsedNumber = int.parse(number);
        setState(() {
          invalidInput = '';
          if (parsedNumber % 2 == 0) {
            evenList.add(parsedNumber);
          } else {
            oddList.add(parsedNumber);
          }
        });
      } else {
        setState(() {
          invalidInput = 'Invalid number format';
        });
      }
    } else {
      setState(() {
        invalidInput = 'Please enter a number';
      });
    }
  }

  void splitList() {
    if (inputList.isNotEmpty) {
      List<String> numbers = inputList.split(',');
      for (String num in numbers) {
        if (num.trim().isEmpty || _containsInvalidCharacters(num.trim())) {
          setState(() {
            invalidInput = 'Invalid characters';
            return;
          });
        }
      }

      setState(() {
        invalidInput = '';
        evenList.clear();
        oddList.clear();

        for (String num in numbers) {
          int parsedNum = int.parse(num.trim());
          if (parsedNum % 2 == 0) {
            evenList.add(parsedNum);
          } else {
            oddList.add(parsedNum);
          }
        }
      });
    } else {
      setState(() {
        invalidInput = 'Please enter a list of numbers';
      });
    }
  }

  bool _containsInvalidCharacters(String value) {
    RegExp invalidChars = RegExp(r'[!@#\$%^&*()<>\.]');
    return invalidChars.hasMatch(value);
  }

  void navigateToSplashScreen() {
    Get.toNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 35, 62),
        title: Text('Number Splitter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black, // Label text color
                        ),
                      ),
                    ),
                    child: TextField(
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Enter a number',
                      ),
                      onChanged: (value) {
                        setState(() {
                          number = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        checkNumber();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 1, 35, 62),
                      ),
                      child: Text('Check Number'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Result: ${number.isNotEmpty ? (int.parse(number) % 2 == 0 ? "Even" : "Odd") : ""}',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  SizedBox(height: 20),
                  Theme(
                    data: Theme.of(context).copyWith(
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black, // Label text color
                        ),
                      ),
                    ),
                    child: TextField(
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Enter a list of numbers (comma-separated)',
                      ),
                      onChanged: (value) {
                        setState(() {
                          inputList = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        splitList();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 1, 35, 62),
                      ),
                      child: Text('Split List'),
                    ),
                  ),
                  Text(
                    'Even List: ${evenList.toString()}',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Odd List: ${oddList.toString()}',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  Text(invalidInput, style: TextStyle(color: Colors.red)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
