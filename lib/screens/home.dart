import 'package:flutter/material.dart';
import 'package:test_before_first_test_task/screens/process.dart';
import 'package:test_before_first_test_task/screens/result.dart';

import '../API/post.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  late String validUrl;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (Uri.parse(value!).isAbsolute == false || value.isEmpty) {
                return 'Please enter https format';
              }
              validUrl = value;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressIndicatorApp()));
                  debugPrint(validUrl);
                  postGet(validUrl);
                }
              },
              child: const Text('Submit'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProgressIndicatorApp()));
              postGet('https://flutter.webspark.dev/flutter/api/');
            },
            child: const Text('Skip and autofill'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GridScreen()));
            },
            child: const Text('GridScreen'),
          ),
        ],
      ),
    );
  }
}
