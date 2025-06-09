// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Form Validation Demo';

//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(appTitle)),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:form_example/screens/first_form.dart';
import 'package:form_example/screens/home.dart';
import 'package:form_example/screens/second_form.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/form1': (context) => FirstForm(),
        '/form2': (context) => SecondForm(),
      },
    ),
  );
}
