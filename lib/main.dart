import 'package:flutter/material.dart';
import 'package:test_before_first_test_task/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Home Screen';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: SafeArea(
          child: const MyCustomForm(),
        ),
        appBar: AppBar(
          title: const Text(appTitle),
        ),
      ),
    );
  }
}


// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: Text('Set valid API base URL in order to continue'),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//           child: TextFormField(
//             controller: myController,
//             // onChanged: (text) {
//             //   bool validURL = Uri.parse(text).isAbsolute;
//             //   if (validURL == true) {
//             //     debugPrint('True');
//             //   } else {
//             //     debugPrint(
//             //         'Text form field: $validURL is not valid, enter https format');
//             //   }
//             // },
//             validator: (value) {
//               bool validURL = Uri.parse(value!).isAbsolute;
//               if (validURL == false || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//             },
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Set here',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
